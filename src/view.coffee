{div, form, input, button, ul, li} = React.DOM

SearchField = React.createClass
  getInitialState: ->
    value: ''

  handleChange: (event) ->
    @setState value: event.target.value

  render: ->
    input
      type: 'search'
      value: @state.value
      onChange: @handleChange

SearchForm = React.createClass
  onSubmit: (event) ->
    event.preventDefault()
    @props.onSubmit @refs.search.getDOMNode().value

  render: ->
    form onSubmit: @onSubmit,
      SearchField ref: 'search'
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
      SearchForm onSubmit: @search
      Results results: @state.results

class View
  constructor: ({@musicService}) ->

  render: ->
    React.renderComponent (Fingertips musicService: @musicService), document.getElementById 'app'

`export default View`
