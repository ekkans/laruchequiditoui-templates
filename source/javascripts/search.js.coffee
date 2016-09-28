substringMatcher = (strs) ->
  (q, cb) ->
    matches = undefined
    substringRegex = undefined
    # an array that will be populated with substring matches
    matches = []
    # regex used to determine if a string contains the substring `q`
    substrRegex = new RegExp(q, 'i')
    # iterate through the pool of strings and for any string that
    # contains the substring `q`, add it to the `matches` array
    $.each strs, (i, str) ->
      if substrRegex.test(str)
        matches.push str
      return
    cb matches
    return

states = [
  'Alabama'
  'Alaska'
  'Arizona'
  'Arkansas'
  'California'
  'Colorado'
  'Connecticut'
  'Delaware'
  'Florida'
  'Georgia'
  'Hawaii'
  'Idaho'
  'Illinois'
  'Indiana'
  'Iowa'
  'Kansas'
  'Kentucky'
  'Louisiana'
  'Maine'
  'Maryland'
  'Massachusetts'
  'Michigan'
  'Minnesota'
  'Mississippi'
  'Missouri'
  'Montana'
  'Nebraska'
  'Nevada'
  'New Hampshire'
  'New Jersey'
  'New Mexico'
  'New York'
  'North Carolina'
  'North Dakota'
  'Ohio'
  'Oklahoma'
  'Oregon'
  'Pennsylvania'
  'Rhode Island'
  'South Carolina'
  'South Dakota'
  'Tennessee'
  'Texas'
  'Utah'
  'Vermont'
  'Virginia'
  'Washington'
  'West Virginia'
  'Wisconsin'
  'Wyoming'
]

$('form[role=search] .typeahead').typeahead {
  hint: true
  minLength: 1
},
  name: 'states'
  source: substringMatcher(states)
  limit: 3
  templates:
    empty: [
      '<div class="tt-suggestion text-muted">',
        'Aucun résultat.',
      '</div>'
    ].join('\n'),
    suggestion: Handlebars.compile('<div>
      <h3><a href="#">{{this}} partage de la valeur</a></h3>
      <a href="#"><strong>Agnes C,</strong> </a>
      <span class="text-muted">le 12 aout \'16</span>
      <p>Au regard du statut d\'auto-entrepreneur qui a coût nom négligeable par rapport
      au commissionnement, que les investissements ne sont pas pris en</p>
      <div><a href="#"><span class="tag tag-default font-weight-bold">Distribution</span></a></div>
      </div>'
    )
    header: '<div class="tt-suggestion"><a href="#"><strong>Options</strong></a>'
    footer: '<div class="tt-suggestion"><a href="#"><strong>Afficher plus <i class="fa fa-chevron-down"></i></strong></a>'
