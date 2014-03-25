!function(e){if("object"==typeof exports)module.exports=e();else if("function"==typeof define&&define.amd)define(e);else{var f;"undefined"!=typeof window?f=window:"undefined"!=typeof global?f=global:"undefined"!=typeof self&&(f=self),f.app=e()}}(function(){var define,module,exports;return (function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);throw new Error("Cannot find module '"+o+"'")}var f=n[o]={exports:{}};t[o][0].call(f.exports,function(e){var n=t[o][1][e];return s(n?n:e)},f,f.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(_dereq_,module,exports){
"use strict";
var Hello = _dereq_("./hello")["default"];
var hello, helloMessage;

hello = new Hello;

helloMessage = document.createElement('p');

helloMessage.textContent = hello.message();

document.body.appendChild(helloMessage);
},{"./hello":2}],2:[function(_dereq_,module,exports){
"use strict";
var Hello;

Hello = (function() {
  function Hello() {}

  Hello.prototype.message = function() {
    return "Hello, how are you?";
  };

  return Hello;

})();

exports["default"] = Hello;
},{}]},{},[1])
(1)
});