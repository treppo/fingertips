`import Hello from '../../src/hello'`

describe 'Hello', ->

  beforeEach ->
    @it = new Hello

  it 'returns a hello message', ->
    expect @it.message()
      .toEqual 'Hello, how are you?'
