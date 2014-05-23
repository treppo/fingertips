`import Scout from '../scout'`

describe 'Scout', ->
  provider =
    search: (term) ->
      artist: term

  mapper =
    map: (obj) ->
      obj

  it 'asks the provider for music and maps the response with the mapper', ->
    term = 'talking heads'
    expected =
      artist: 'talking heads'

    result = Scout.search
      provider: provider
      mapper: mapper
      term: term

    expect result
      .toEqual expected
