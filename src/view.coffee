{div, form, input, button, ul, li, img} = React.DOM

initialResult =
  title: 'Search for any track you like,'
  artist: '25 million songs are at your fingertips.'

SearchField = React.createClass
  getInitialState: ->
    value: ''

  handleChange: (event) ->
    @setState value: event.target.value

  render: ->
    input
      className: 'search-field'
      type: 'search'
      value: @state.value
      onChange: @handleChange
      placeholder: 'e.g. Talking Heads Once In A Lifetime'

SearchForm = React.createClass
  onSubmit: (event) ->
    event.preventDefault()
    @props.onSubmit @refs.search.getDOMNode().value

  render: ->
    form className: 'row collapse', onSubmit: @onSubmit,
      div className: 'small-9 medium-11 columns',
        SearchField ref: 'search'
      div className: 'small-3 medium-1 columns',
        button className: 'search-button', type: 'submit', 'Search'

Results = React.createClass
  render: ->
    createListItem = (result) ->
      li className: 'result',
        img src: result.img, className: 'result__image'
        div className: 'result__title',
          result.title
        div className: 'result__artist',
          result.artist

    ul className: 'result-list', @props.results.map createListItem

Fingertips = React.createClass
  getInitialState: ->
    results: [initialResult]

  search: (term) ->
    @props.musicService
      .search term
      .then (results) =>
        @setState results: results

  render: ->
    div className: 'content-column',
      SearchForm onSubmit: @search
      Results results: @state.results

class View
  constructor: ({@musicService}) ->

  render: ->
    React.renderComponent (Fingertips musicService: @musicService), document.getElementById 'app'

`export default View`
