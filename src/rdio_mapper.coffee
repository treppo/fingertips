`import Record from './record'`

recordsFromResult = ({artist, name}) ->
  new Record artist: artist, title: name

RdioMapper =
  map: (response) ->
    response.result.results.map recordsFromResult

`export default RdioMapper`
