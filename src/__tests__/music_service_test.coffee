`import MusicService from '../music_service'
import responseFixture from './rdio_response_fixture'
import Record from '../record'`

describe 'MusicService', ->

  beforeEach ->
    # unfortunately the rdio library has to be mocked, as it needs a DOM
    global.R =
      request: (config) ->
        config.success responseFixture
    @service = new MusicService

  it 'searches results for a term', ->
    searchTerm = 'talking heads once in a lifetime'
    record1 = new Record
      artist: 'Talking Heads'
      title: 'Once In A Lifetime'
    record2 = new Record
      artist: 'Talking Heads'
      title: 'Once In A Lifetime (2005 Remastered Album Version)'
    actual = 0
    isDone = false

    runs ->
      @service
        .search searchTerm
        .then (results) ->
          actual = results
          isDone = true

    waitsFor ->
      isDone

    runs ->
      expect actual
        .toEqual [record1, record2]
