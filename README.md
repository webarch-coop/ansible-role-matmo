# Matomo Ansible Role

[![pipeline status](https://git.coop/webarch/matomo/badges/master/pipeline.svg)](https://git.coop/webarch/matomo/-/commits/master)

This repository contains an Ansible role for installing and upgrading
[Matomo](https://matomo.org/) servers using the command line and web based
installer.

See the [defaults](defaults/main.yml) for the default options, please use a
[release tag](https://git.coop/webarch/matomo/-/releases) in your
`requirements.yml` file if you use this role.

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

## Matomo user accounts

If a superuser username, password and token authentication string are provided
(these can be sorted encrypted using Ansible vault on the Ansible controller)
then this role can also be used to add Matomo user accounts and sites using the
Matomo API.

To add a Matomo user account include this role with tasks from
`user_present.yml` and then the tasks in these files will be run:


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

Since a users password is needed to generate a `token_auth` which is in turn
needed to automatically configure the Matomo WordPress plugin this role will
optionally store a record of passwords (but doesn't prevent using from changing
them) and reset them when needs be in a YAML file format based on the results
of the `UsersManager.getUsersPlusRole` API method:

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

To add a Matomo site include this role with tasks from `site_present.yml` and
then the tasks in these files will be run:

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

To check for two sites having the same URL include this role with tasks from
`check_sites.yml` and then the tasks in these files wil be run:

```
check_site.yml
  |
  \-- check_duplicate_urls.yml
        |
        \-- check_duplicate_url.yml
``` 
