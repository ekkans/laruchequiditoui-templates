#= require editor/bootstrap-switch

#= require medium-editor/dist/js/medium-editor
#= require jquery-sortable/source/js/jquery-sortable
#= require blueimp-file-upload/js/vendor/jquery.ui.widget
#= require blueimp-file-upload/js/jquery.iframe-transport
#= require blueimp-file-upload/js/jquery.fileupload
#= require medium-editor-insert-plugin/dist/js/medium-editor-insert-plugin
#= require medium-editor-markdown/dist/me-markdown.standalone.min

$ ->
  $('.markdown-container').hide()
  $('.markdown-container').removeClass 'invisible'

  $('header .btn-primary, aside .btn-primary').on 'click', ->
    setTimeout ->
      $('main').hide()
    , 600
    $('#editor').addClass('visible')
  $('a.editor-header-text').on 'click', ->
    $('#editor').removeClass('visible')
    $('main').show()

  $markdownSwitch = $('#editor input[name=markdown]')
  $markdownSwitch.bootstrapSwitch
    inverse: true
    offText: '&nbsp;'
    onText: '&nbsp;'
  $markdownSwitch.on 'switchChange.bootstrapSwitch', (event, state) ->
    if state
      $('.editor-body-textarea').hide()
      $('.markdown-container').show()
    else
      $('.editor-body-textarea').show()
      $('.markdown-container').hide()

  editorTitle = new MediumEditor 'h1.editable',
    toolbar: false
    disableReturn: true
    disableDoubleReturn: true
    placeholder:
      text: 'Donner un titre'

  markDownEl = $(".markdown-container")
  editorBody = new MediumEditor 'textarea.editable',
    extensions:
      markdown: new MeMarkdown (markdown) ->
        cleanedMarkdown = markdown.split('<div class="medium-insert-buttons"')[0]
        markDownEl.text cleanedMarkdown
    toolbar:
      buttons: [
        {
          name: 'bold'
          action: 'bold'
          aria: 'bold'
          tagNames: ['b', 'strong']
          contentDefault: '<b>G</b>'
        }
        'italic'
        {
          name: 'strikethrough'
          action: 'strikethrough'
          aria: 'strike through'
          tagNames: ['s', 'strike']
          contentDefault: '<i class="fa fa-strikethrough"></i>'
        }
        'h2'
        'h3'
        {
          name: 'unorderedlist'
          action: 'insertunorderedlist'
          aria: 'unordered list'
          tagNames: ['ul']
          contentDefault: '<i class="fa fa-list-ul"></i>'
        }
        {
          name: 'orderedlist'
          action: 'insertorderedlist'
          aria: 'ordered list'
          tagNames: ['ol']
          contentDefault: '<i class="fa fa-list-ol"></i>'
        }
        'quote'
        {
          name: 'anchor'
          action: 'createlink'
          aria: 'link'
          tagNames: ['a']
          contentDefault: '<i class="fa fa-link"></i>'
        }
      ]
    placeholder:
      text: 'et commencer votre message ici (taper " : " pour les émojis :D)'
  $('textarea.editable').mediumInsert
    editor: editorBody
