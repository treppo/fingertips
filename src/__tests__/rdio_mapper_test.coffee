`import RdioMapper from '../rdio_mapper'
import Record from '../record'
import recordList from './rdio_record_list'
import responseFixture from './rdio_response_fixture'`

describe 'RdioMapper', ->
  it 'maps the rdio response object to a record list', ->
    expect RdioMapper.map responseFixture
      .toEqual recordList
