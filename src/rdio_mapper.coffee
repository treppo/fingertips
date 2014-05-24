`import Record from './record'`

leftPad = (number) ->
  numberString = "#{number}"
  return "0" + numberString if numberString.length < 2

  numberString

toMinutesString = (seconds) ->
  sec = leftPad seconds % 60
  "#{ Math.floor(seconds / 60) }:#{ sec }"


recordsFromResult = ({artist, name, icon, key, duration}) ->
  new Record
    artist: artist
    title: name
    img: icon
    id: key
    duration: toMinutesString duration

RdioMapper =
  map: (response) ->
    response.result.results.map recordsFromResult

`export default RdioMapper`
