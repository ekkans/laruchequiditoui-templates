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

## Post-install customization

The following customization is needed because a plugin can't override the file desktop.css

Go to /admin/customize/css_html/

Click on new

Add the following code in the css tab:

``` css
@import "vendor/font_awesome/font-awesome";
@import "vendor/pikaday";
@import "common/foundation/helpers";
@import "vendor/select2";
@import "common/foundation/mixins";
@import "common/foundation/variables";
@import "common/components/badges";
@import "common/components/banner";
@import "common/components/date-picker";
@import "common/components/hashtag";
@import "common/components/keyboard_shortcuts";
@import "common/components/navs";
@import "common/input_tip";
@import "common/topic-entrance";
@import "common/printer-friendly";
@import "common/base/topic-list";
@import "common/base/about";
@import "common/base/activation";
@import "common/base/bbcode";
@import "common/base/cat_reorder";
@import "common/base/code_highlighting";
@import "common/base/colorpicker";
@import "common/base/combobox";
@import "common/base/compose";
@import "common/base/composer-user-selector";
@import "common/base/directory";
@import "common/base/discourse";
@import "common/base/ember-select";
@import "common/base/emoji";
@import "common/base/exception";
@import "common/base/faqs";
@import "common/base/history";
@import "common/base/lightbox";
@import "common/base/login";
@import "common/base/magnific-popup";
@import "common/base/menu-panel";
@import "common/base/mobile";
@import "common/base/modal";
@import "common/base/notification-options";
@import "common/base/onebox";
@import "common/base/request_access";
@import "common/base/rtl";
@import "common/base/search";
@import "common/base/share_link";
@import "common/base/tagging";
@import "common/base/topic";
@import "common/base/topic-admin-menu";
@import "common/base/topic-post";
@import "common/base/upload";
@import "common/base/user";
@import "common/base/user-badges";
@import "common/base/username_tagsinput";
@import "common/d-editor";
@import "desktop/banner";
@import "desktop/compose";
@import "desktop/login";
@import "desktop/modal";
@import "desktop/user-card";
@import "desktop/category-list";
@import "desktop/topic-list";
.posts {
    @import "desktop/topic-post";
}
@import "desktop/topic-timeline";
@import "desktop/topic";
@import "desktop/upload";
@import "desktop/user";
@import "desktop/history";
@import "desktop/menu-panel";
@import "plugins";
@import "plugins_desktop";
@import "category_backgrounds";
```

Save

Click on the preview button

On the new page, go to the console and copy the result of $('.custom-css').attr('href')

Then add the following code in the head tab and don't forget to paste in cssUrl the value you just copied

```
<script type="text/discourse-plugin" version="0.4">
  api.onPageChange((url) => {
    var cssUrl = undefined; // replace undefined by the value of $('.custom-css').attr('href')

    if(url.substring(0, 6) == '/admin') {
      $('head').append('<link href="' + cssUrl + '" rel="stylesheet" />');
    }

    $("[href^='/stylesheets/desktop']").remove();
  });
</script>
```

Save

Enable the customization
