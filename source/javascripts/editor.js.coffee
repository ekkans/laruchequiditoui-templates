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
  $('#editor').show()
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
      buttons: ['bold'
        'italic'
        'strikethrough'
        'h2'
        'h3'
        'unorderedlist'
        'orderedlist'
        'quote'
        'anchor'
      ]
    placeholder:
      text: 'et commencer votre message ici (taper " : " pour les émojis :D)'
  $('textarea.editable').mediumInsert
    editor: editorBody
