`import MusicService from '../music_service'
import recordList from './rdio_record_list'
import responseFixture from './rdio_response_fixture'`

describe 'MusicService', ->

  beforeEach ->
    # unfortunately the rdio library has to be mocked, as it needs a DOM
    global.R =
      request: (config) ->
        config.success responseFixture
    @service = new MusicService

  it 'searches results for a term', ->
    searchTerm = 'talking heads once in a lifetime'
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
    , 'loading results', 1000

    runs ->
      expect actual
        .toEqual recordList
