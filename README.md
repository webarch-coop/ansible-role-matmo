# Webarchitects Matomo Ansible Role

[![pipeline status](https://git.coop/webarch/matomo/badges/master/pipeline.svg)](https://git.coop/webarch/matomo/-/commits/master)

This repository contains an Ansible role for installing and upgrading [Matomo](https://matomo.org/) servers using the command line and web based installer.

See the [defaults](defaults/main.yml) for the default options, please use a [release tag](https://git.coop/webarch/matomo/-/releases) in your `requirements.yml` file if you use this role.

Note that this role don't add the `matomo_user` user account or the `matomo_group` group or create the `matomo_html`, `matomo_private` or `matomo_logs` directories, as we use the [Webarchitects users role](https://git.coop/webarch/users) for this.

## Install Matomo

By default only these tasks are run:

```
main.yml
  |
  \-- check_variables.yml
  |     |
  |     \-- check_version.yml
  |     |
  |     \-- check_auth.yml
  |     |
  |     \-- check_latest_version.yml
  |
  \-- upgrade.yml
  |
  \-- install.yml
  |    |
  |    \-- download.yml
  |    |
  |    \-- install_web.yml
  |
  \-- geolocation.yml
  |
  \-- settings.yml
  |
  \-- cron.yml
```

## Upgrading Matomo

This role works fine for upgrading Matomo sites, for Matomo 4.6.1 and upwards it also includes [scripts for deleting files](files/delete_files_scripts).

## Matomo user accounts

If a superuser username, password and token authentication string are provided (these can be sorted encrypted using Ansible vault on the Ansible controller) then this role can also be used to add Matomo user accounts and sites using the Matomo API.

To add a Matomo user account include this role with tasks from `user_present.yml` and then the tasks in these files will be run:


```
user_present.yml
  |
  \-- check_login.yml
  |     |
  |     \-- update_email.yml
  |     |
  |     |-- add_user.yml
  |
  \-- check_password.yml
        |
        \-- update_password.yml
```

Since a users password is needed to generate a `token_auth` which is in turn needed to automatically configure the Matomo WordPress plugin this role will optionally store a record of passwords (but doesn't prevent using from changing them) and reset them when needs be in a YAML file format based on the results of the `UsersManager.getUsersPlusRole` API method:

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

## Matomo sites

To add a Matomo site include this role with tasks from `site_present.yml` and then the tasks in these files will be run:

```
site_present.yml
  |
  \-- get_all_sites.yml
  |
  \-- get_sites_id_from_site_url.yml
  |     |
  |     \-- check_main_url.yml
  |
  \-- update_site.yml
  |
  \-- add_site.yml
```

## Duplicate sites

To check (in a rather slow manner) for two sites having the same URL include this role with tasks from `check_sites.yml` and then the tasks in these files wil be run:

```
check_site.yml
  |
  \-- check_duplicate_urls.yml
        |
        \-- check_duplicate_url.yml
``` 

## Ansible Galaxy and repo URL

The primary URL of this repo is [`https://git.coop/webarch/matomo`](https://git.coop/webarch/matomo) however it is also [mirrored to GitHub](https://github.com/webarch-coop/ansible-role-matmo) and [available via Ansible Galaxy](https://galaxy.ansible.com/chriscroome/matomo).

If you use this role please use a tagged release, see [the release notes](https://git.coop/webarch/matomo/-/releases).

This role can also be used with the [localhost repo](https://git.coop/webarch/localhost) to install `matomo` locally.

