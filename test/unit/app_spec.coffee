`import App from '../../src/app'`

describe 'App', ->

  beforeEach ->
    @it = new App

  it 'returns a hello message', ->
    expect @it.helloMessage()
      .toEqual 'Hello, how are you?'
