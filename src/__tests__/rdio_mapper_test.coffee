`import RdioMapper from '../rdio_mapper'
import Record from '../record'
import responseFixture from './rdio_response_fixture'`

describe 'RdioMapper', ->
  it 'maps the rdio response object to a record list', ->
    record1 = new Record
      artist: 'Talking Heads'
      title: 'Once In A Lifetime'

    record2 = new Record
      artist: 'Talking Heads'
      title: 'Once In A Lifetime (2005 Remastered Album Version)'

    expect RdioMapper.map responseFixture
      .toEqual [record1, record2]
