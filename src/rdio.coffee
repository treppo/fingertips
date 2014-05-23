Q = require 'q'

Rdio =
  search: (term) ->
    deferred = Q.defer()

    R.request
      method: 'search'
      content:
        types: 'track'
        query: term
      success: (response) ->
        deferred.resolve response
      error: (error) ->
        deferred.resolve error

    deferred.promise

`export default Rdio`
