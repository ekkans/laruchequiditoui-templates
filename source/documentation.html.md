---
title: Documentation
---

Documentation
=============

This plugin has been tested on Discourse version 1.7.0.beta5

## Plugins

This plugin uses the plugin *discourse-topic-previews* (0.2) so it's better to install it too

This plugin has been tested with those default plugins: discourse-details (0.4),
discourse-nginx-performance-report (0.1), docker_manager (0.1), lazyYT (1.0.1),
poll (0.9).

## Configuration

1 - Go to /admin/site_settings/category/basic

And change default values for:

- *top menu* = "latest|new|unread|top|-[category]"

- *post menu* = "reply|like-count|like|share|flag|edit|bookmark|delete|admin"

- *enable mobile theme* = disabled

2 - Go to /admin/site_settings/category/uncategorized

- *version checks* = disabled

- *new version emails* = disabled

The new versions have to be tested first in the staging environment

3 - Go to /admin/site_settings/category/tags

And change default values for:

- *tagging enabled* = enabled

- *tag style* = box

4 - Go to /admin/site_settings/category/plugins

- *topic list thumbnails* = enabled

- *topic list excerpts* = enabled

- *topic list actions* = enabled

- *topic list show like on current users posts* = enabled

- *topic list excerpt length* = 400

- *lrqdo enabled* = enabled

## Installation using docker

```
cd /var/discourse
vi container/app.yml
```

Add the following to your app.yml in the plugins section:

```
hooks:
  after_code:
    - exec:
        cd: $home/plugins
        cmd:
          - mkdir -p plugins
          - git clone https://github.com/ekkans/lrqdo-plugin-discourse.git
```

and rebuild docker via

```
./launcher rebuild app
```
