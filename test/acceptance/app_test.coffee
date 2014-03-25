casper.test.begin 'App loads in browser', 2, (test) ->
  casper.start 'http://localhost:1234', ->

  casper.then ->
    test.assertTitle 'App'
    test.assertTextExists 'Hello there!'

  casper.run -> test.done()
