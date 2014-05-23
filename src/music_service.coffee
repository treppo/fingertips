`import Rdio from './rdio'
import RdioMapper from './rdio_mapper'
import Scout from './scout'`

class MusicService
  search: (term) ->
    Scout.search
      provider: Rdio
      mapper: RdioMapper
      term: term

`export default MusicService`
