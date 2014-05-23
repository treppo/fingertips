`import Scout from '../scout'`

describe 'Scout', ->
  provider =
    search: (term) ->
      then: (func) ->
        func artist: term

  mapper =
    map: (obj) ->
      then: (func) ->
        func [obj]

  it 'asks the provider for music and maps the response with the mapper', ->
    term = 'talking heads'
    expected =
      [artist: 'talking heads']
    actual = []

    Scout
      .search
        provider: provider
        mapper: mapper
        term: term
      .then (results) ->
        actual = results

    expect actual
      .toEqual expected
