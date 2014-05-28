{a, div, form, input, button, ul, li, img} = React.DOM

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
      isCurrentTrack = result.id is @props.currentTrack
      currentClass = if isCurrentTrack then 'current-track' else ''
      pausedClass = if isCurrentTrack and @props.isPaused then 'is-paused' else ''

      li className: "result #{currentClass} #{pausedClass}",
        a className: 'result__link', onClick: @props.onClick.bind(null, result.id),
          div className: 'result__overlay',
            '‖'
          img src: result.img, className: 'result__image'
          div className: 'result__title',
            result.title
          div className: 'result__artist',
            result.artist

    ul className: 'result-list', @props.results.map createListItem.bind this

Fingertips = React.createClass
  getInitialState: ->
    results: [initialResult]
    currentTrack: ''
    isPaused: false

  search: (term) ->
    @props.musicService
      .search term
      .then @setResults, @showError

  setResults: (results) ->
    @setState results: results

  showError: (message) ->
    @setState results: [title: 'Oooops', artist: message]

  play: (trackId) ->
    if @state.currentTrack is trackId
      @props.player.togglePause()
      @setState isPaused: not @state.isPaused
    else
      @setState isPaused: false
      @setState currentTrack: trackId
      @props.player.play trackId

  render: ->
    div className: 'content-column',
      SearchForm onSubmit: @search
      Results
        results: @state.results
        onClick: @play
        currentTrack: @state.currentTrack
        isPaused: @state.isPaused

class View
  constructor: ({@musicService, @player}) ->

  render: ->
    React.renderComponent (Fingertips musicService: @musicService, player: @player), document.getElementById 'app'

`export default View`
