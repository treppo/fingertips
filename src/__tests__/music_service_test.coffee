`import MusicService from '../music_service'`
`import Record from '../record'`

describe 'MusicService', ->

  beforeEach ->
    @it = new MusicService

  it 'searches results for a term', ->
    searchTerm = 'talking heads'
    result = new Record
      artist: 'Talking Heads'
      title: 'Once in a lifetime'

    expect @it.search searchTerm
      .toContain result
