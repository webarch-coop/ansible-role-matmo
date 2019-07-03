# Ansible Matomo

This repository contains an Ansible role for installing and upgrading [Matomo](https://matomo.org/) servers, based on the [ExtraTools plugin](https://github.com/digitalist-se/extratools) for the install and the [manual upgrade steps](https://matomo.org/docs/update/#the-manual-three-step-update).

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
    matomo_db_name: "{{ matomo_user }}"
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

There isn't yet a `deletesite.yml` set of tasks due to the [lack of a `site:delete` command](https://github.com/digitalist-se/extratools/issues/7).
