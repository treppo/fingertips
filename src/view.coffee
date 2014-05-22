{div, form, input, button, ul, li} = React.DOM

Search = React.createClass
  getInitialState: ->
    term: ''

  handleChange: (event) ->
    @setState term: event.target.value

  onSubmit: (event) ->
    event.preventDefault()
    @props.onSubmit @refs.search.getDOMNode().value

  render: ->
    form onSubmit: @onSubmit,
      input
        type: 'search'
        ref: 'search'
        value: @state.term
        onChange: @handleChange
      button type: 'search', 'Search'

Results = React.createClass
  render: ->
    createListItem = (result) ->
      li {}, result

    ul {}, @props.results.map createListItem

Fingertips = React.createClass
  getInitialState: ->
    results: []

  search: (term) ->
    @setState results: @props.musicService.search term

  render: ->
    div {},
      Search onSubmit: @search
      Results results: @state.results

class View
  constructor: ({@musicService}) ->

  render: ->
    React.renderComponent (Fingertips musicService: @musicService), document.getElementById 'app'

`export default View`
