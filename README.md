# Ansible Matomo

Currently this repository contains an Ansible role for upgrading [Matomo](https://matomo.org/l) servers, based on the [manual upgrade steps](https://matomo.org/docs/update/#the-manual-three-step-update). 

At some point in the future the ability to [install Matomo](https://matomo.org/docs/installation/) might be added.

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
ansible-galaxy install -r requirements.yml --force -p roles 
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

Then it can be run as follows:

```bash
ansible-playbook matomo.yml -i hosts.yml
``` 
