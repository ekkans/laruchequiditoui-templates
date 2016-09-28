#= require bootstrap-custom

$ ->
  $search = $('input')
  $search.focusin ->
    $('header > .navbar').addClass 'navbar-search-focus'
  $search.focusout ->
    $('header > .navbar').removeClass 'navbar-search-focus'
