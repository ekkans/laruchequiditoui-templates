###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/", layout: :portfolio

# General configuration

###
# Helpers
###

# Pretty URLs - https://middlemanapp.com/advanced/pretty_urls/
activate :directory_indexes

# Middleman-Syntax - https://github.com/middleman/middleman-syntax
set :haml, { ugly: true }
require 'slim'

# Middleman-Sprockets - https://github.com/middleman/middleman-sprockets
activate :sprockets

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Add bower's directory to sprockets asset path
after_configuration do
  sprockets.append_path File.join "#{root}", "bower_components"
end

# Build-specific configuration
configure :build do
  # Minify CSS on build
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Ignoring Files
  ignore 'javascripts/_*'
  ignore 'javascripts/vendor/*'
  ignore 'stylesheets/_*'
  ignore 'stylesheets/vendor/*'
end
