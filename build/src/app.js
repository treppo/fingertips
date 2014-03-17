"use strict";
var App;

App = (function() {
  function App() {}

  App.prototype.helloMessage = function() {
    return "Hello, how are you?";
  };

  return App;

})();

exports["default"] = App;