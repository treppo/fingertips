`import MusicService from './music_service'
import RdioPlayer from './rdio_player'
import View from './view'`

musicService = new MusicService
view = new View musicService: musicService, player: RdioPlayer
view.render()
