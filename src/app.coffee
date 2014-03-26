`import Hello from './hello'`

hello = new Hello
helloMessage = document.createElement 'p'
helloMessage.textContent = hello.message()
document.getElementsByClassName('main-content')[0].appendChild helloMessage

