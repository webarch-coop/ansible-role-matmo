# Ansible Matomo

This repository contains an Ansible role for installing and upgrading [Matomo](https://matomo.org/) servers, 

This role also contains tasks to add delete users using the [UserConsole](https://github.com/digitalist-se/userconsole) plugin and also tasks to add and update sites, however there isn't yet a delete site set of tasks due to the [lack of a `site:delete` command](https://github.com/digitalist-se/extratools/issues/7) in ExtraTools.

For some tasks, where commands are not yet available to be run using the PHP console, there is direct editing of the Matomo MySQL database, hopefully this can be removed at some point in the future.

To use this role you need to use Ansible Galaxy to install it into another repository by adding a `requirements.yml` file in that repo that contains:

```yml
---
- name: matomo
  src: https://git.coop/webarch/matomo.git
  version: master
  scm: git
```

To pull this repo in run:

```bash
ansible-galaxy install -r requirements.yml --force -p galaxy/roles 
```

The other repo should also contain a `matomo.yml` file that contains:

```yml
---
- name: Upgrade Matomo
  become: yes

  hosts: matomo_servers

  vars:
    matomo_user: stats
    matomo_home: "/home/{{ matomo_user }}"
    matomo_html: "{{ matomo_home }}/sites/default"
    matomo_private: "{{ matomo_home }}/private"
    matomo_db_username: "{{ matomo_user }}"
    matomo_db_pass: ""
    matomo_db_host: localhost
    matomo_dbname: "{{ matomo_user }}"
    matomo_first_site_name: "{{ inventory_hostname }}"
    matomo_first_site_url: "http://{{ inventory_hostname }}/"
    matomo_first_user: "{{ matomo_user }}"
    matomo_first_user_email: "root@{{ inventory_hostname }}"
    matomo_first_user_pass: ""
    matomo_notify_from: "root@{{ inventory_hostname }}"
    matomo_notify_reply_to: "support@example.org"
    matomo_notify_headers:
      - "Reply-To={{ matomo_notify_reply_to }}"
      - X-Auto-Response-Suppress = All

  roles:
    - matomo
```

And a `hosts.yml` file that contains a `matomo_servers` list as follows: 

```yml
---
all:
  children:
    matomo_servers:
      hosts:
        host1.example.org:
        host2.example.org:
```

Only the first four variables above are needed for upgrades, the other variables are only needed for the install, if a `~/.my.cnf` exists the database passwd is taken from there, the database name and user defaults to `matomo_user`, if the first user password is not set a random one is generated and sent via SMTP, port 25 on the server to the user.

Then it can be run as follows:

```
bash
ansible-playbook matomo.yml -i hosts.yml
``` 

The `adduser.yml` and `deleteusers.yml` tasks can be called from other roles, for example:

```yml
- name: Include delete user tasks from Matomo role
  include_role:
    name: matomo
    tasks_from: deleteuser.yml
  vars:
    matomo_login: "{{ item.key }}"
    matomo_login_email: "{{ item.value.users_email }}"
```

```yml
- name: Include adduser tasks from Matomo role
  include_role:
    name: matomo
    tasks_from: adduser.yml
  vars:
    matomo_login: "{{ item.key }}"
    matomo_login_home: "{{ item.value.users_home | default('/home/' + item.key) }}"
    matomo_login_email: "{{ item.value.users_email }}"
    matomo_notify_passwd: "{{ item.value.users_matomo_notify_passwd | default(true) }}"
    matomo_notify_from: "{{ users_notify_from }}"
    matomo_notify_reply_to: "{{ users_notify_reply_to }}"
    matomo_notify_subject_tag: "{{ users_notify_subject_tag }}"
    matomo_notify_headers: "{{ users_notify_headers }}"
    matomo_notify_signature: "{{ users_notify_signature }}"
```

Also for example for `addsite.yml`:

```yml
- name: addsite.yml tasks from Matomo role included for each vhost which isn't hosting a Matomo site
  include_role:
    name: matomo
    tasks_from: addsite.yml
  vars:
    matomo_site_name: "{{ vhost.value.users_apache_server_name }}"
    matomo_site_main_url: "http://{{ vhost.value.users_apache_server_name }}"
    # https://gist.github.com/halberom/b1f6eaed16dba1b298e8#gistcomment-2706913
    matomo_site_urls: "{% if vhost.value.users_apache_server_aliases is defined %}{{ vhost.value.users_apache_server_aliases | map('regex_replace', '^(.*)$','http://\\1') | list }}{% endif %}"
    matomo_site_admin: "{{ item.key }}"
  when: ( vhost.value.users_cms is not defined ) or ( vhost.value.users_cms is defined and vhost.value.users_cms != "matomo" )
  loop: "{{ item.value.users_apache_virtual_hosts | dict2items }}"
  loop_control:
    loop_var: vhost
```

## Storing passwords

Since a users password is needed to generate a `token_auth` which is needed to
automatically configure the Matomo WordPress plugin this role will optionally
store a record or passwords (but doesn't prevent using from changing them) and
reset them when needs be in a YAML file format based on the results of the
`UsersManager.getUsersPlusRole` API method:

```yml
---
matomo_accounts:
  - login: user 
    email: user@example.org
    password: XXX
    superuser_access: false
    role: noaccess
    capabilities: []
```

## Matomo user present

This ASCII flowchart explains the logic used when the `user_present.yml` tasks are run:

```
+--------------------------+  YES, there is a                                       +-------------------------------+  YES, the password is
|                          |  matching email                                        |                               |  correct
|  user_present.yml        |  address                                               | check_password.yml            |
|                          |                                                        |                               |
|  Check if a Matomo login +------------------------------------------------------->+ Check if the password on file +----------------------+
|  exists with an email    |  Set a variable for                                    | is correct for the user with  |                      |
|  address that matches    |  the existing login                                    | the matomo_login_existing     |                      |
|  matomo_login_email      |  matomo_login_existing                                 |                               |                      |
|                          |                                                        |                               |                      |
+----------+---------------+                                                        +--------------+----------------+                      |
           |                                                                                       |                                       |
           |  No, there is not an                                                                  | No, the password                      |
           |  existing matching                                                                    | is incorrect                          |
           |  email address                                                                        |                                       |
           v                                                                                       v                                       |
+----------+---------------+                           +-------------------+        +--------------+----------------+                      |
|                          | NO, there is no existing  |                   |        |                               |                      |
|  check_login.yml         | account                   | add_user.yml      |        |  update_password.yml          |                      |
|                          |                           |                   |        |                               |                      |
|  Check if a Matomo login +-------------------------->+ Add a new Matomo  |        |  Update the password for      |                      |
|  exists with a username  |                           | user account      |        |  matomo_login_existing        |                      |
|  that matches            |                           |                   |        |                               |                      |
|  matomo_login            |                           |                   |        |                               |                      |
|                          |                           |                   |        |                               |                      |
+----------+---------------+                           +---------+---------+        +--------------+----------------+                      |
           |                                                     |                                 |                                       |
           |  YES, an existing account                           |                                 |                                       |
           |  with a matching login                              |                                 |                                       |
           |  exists                                             |                                 |                                       |
           |                                                     |                                 |                                       |
           v                                                     |                                 v                                       |
+----------+---------------+                                     |                          +------+---------+                             |
|                          |                                     +------------------------->+                |                             |
|  update_email.yml        |                                                                |  End, tasks    |                             |
|                          +--------------------------------------------------------------->+  complete      +<----------------------------+
|  Update the email        |                                                                |                |
|  address                 |                                                                |                |
|                          |                                                                +----------------+
+--------------------------+

```
