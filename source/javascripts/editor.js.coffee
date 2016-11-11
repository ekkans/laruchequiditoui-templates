#= require editor/bootstrap-switch

#= require medium-editor/dist/js/medium-editor
#= require jquery-sortable/source/js/jquery-sortable
#= require blueimp-file-upload/js/vendor/jquery.ui.widget
#= require blueimp-file-upload/js/jquery.iframe-transport
#= require blueimp-file-upload/js/jquery.fileupload
#= require medium-editor-insert-plugin/dist/js/medium-editor-insert-plugin

$ ->
  $('#editor').show()
  $('#editor input[name=markdown]').bootstrapSwitch
    inverse: true
    offText: '&nbsp;'
    onText: '&nbsp;'

  editorTitle = new MediumEditor 'h1.editable',
    placeholder:
      text: 'Donner un titre'
  editorBody = new MediumEditor 'textarea.editable',
    placeholder:
      text: 'et commencer votre message ici (taper " : " pour les émojis :D)'
  $('textarea.editable').mediumInsert
    editor: editorBody
