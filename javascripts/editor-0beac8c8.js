(function(){$(function(){var e,t,a,i;return $(".markdown-container").hide(),$(".markdown-container").removeClass("invisible"),$("header .btn-primary, aside .btn-primary").on("click",function(){return setTimeout(function(){return $("main").hide()},600),$("#editor").addClass("visible")}),$("a.editor-header-text").on("click",function(){return $("#editor").removeClass("visible"),$("main").show()}),e=$("#editor input[name=markdown]"),e.bootstrapSwitch({inverse:!0,offText:"&nbsp;",onText:"&nbsp;"}),e.on("switchChange.bootstrapSwitch",function(e,t){return t?($(".editor-body-textarea").hide(),$(".markdown-container").show()):($(".editor-body-textarea").show(),$(".markdown-container").hide())}),a=new MediumEditor("h1.editable",{toolbar:!1,disableReturn:!0,disableDoubleReturn:!0,placeholder:{text:"Donner un titre"}}),i=$(".markdown-container"),t=new MediumEditor("textarea.editable",{extensions:{markdown:new MeMarkdown(function(e){var t;return t=e.split('<div class="medium-insert-buttons"')[0],i.text(t)})},toolbar:{buttons:[{name:"bold",action:"bold",aria:"bold",tagNames:["b","strong"],contentDefault:"<b>G</b>"},"italic",{name:"strikethrough",action:"strikethrough",aria:"strike through",tagNames:["s","strike"],contentDefault:'<i class="fa fa-strikethrough"></i>'},"h2","h3",{name:"unorderedlist",action:"insertunorderedlist",aria:"unordered list",tagNames:["ul"],contentDefault:'<i class="fa fa-list-ul"></i>'},{name:"orderedlist",action:"insertorderedlist",aria:"ordered list",tagNames:["ol"],contentDefault:'<i class="fa fa-list-ol"></i>'},"quote",{name:"anchor",action:"createlink",aria:"link",tagNames:["a"],contentDefault:'<i class="fa fa-link"></i>'}]},placeholder:{text:'et commencer votre message ici (taper " : " pour les \xe9mojis :D)'}}),$("textarea.editable").mediumInsert({editor:t})})}).call(this);