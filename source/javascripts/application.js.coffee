#= require bootstrap-custom
#= require typeahead.js/dist/typeahead.jquery.min
#= require handlebars/handlebars.min
#= require search

$ ->
  $search = $('header input')
  $search.focusin ->
    $('header > .navbar').addClass 'navbar-search-focus'
  $search.focusout ->
    $('header > .navbar').removeClass 'navbar-search-focus'
