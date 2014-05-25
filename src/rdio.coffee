Q = require 'q'

Rdio =
  search: (term) ->
    deferred = Q.defer()

    R.ready ->
      R.request
        method: 'search'
        content:
          types: 'track'
          query: term
        success: (response) ->
          deferred.resolve response
        error: (error) ->
          deferred.reject new Error error

    deferred.promise

`export default Rdio`
