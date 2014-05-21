{div, input, button, ul, li} = React.DOM

Search = React.createClass
  render: ->
    div {},
      input type: 'search'
      button type: 'submit', 'Search'

Results = React.createClass
  render: ->
    createListItem = (result) ->
      li {}, result

    ul {}, @props.results.map createListItem

Fingertips = React.createClass
  getInitialState: ->
    results: ['Track 1', 'Track 2']

  render: ->
    div {},
      @props.message
      Search {}
      Results results: @state.results

class View
  constructor: (@messenger) ->

  render: ->
    React.renderComponent (Fingertips message: @messenger.message()), document.getElementById 'app'

`export default View`
