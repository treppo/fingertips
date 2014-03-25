`import Hello from './hello'`

hello = new Hello
helloMessage = document.createElement 'p'
helloMessage.textContent = hello.message()
document.body.appendChild helloMessage
