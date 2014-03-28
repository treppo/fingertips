!function(e){if("object"==typeof exports)module.exports=e();else if("function"==typeof define&&define.amd)define(e);else{var f;"undefined"!=typeof window?f=window:"undefined"!=typeof global?f=global:"undefined"!=typeof self&&(f=self),f.app=e()}}(function(){var define,module,exports;return (function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);throw new Error("Cannot find module '"+o+"'")}var f=n[o]={exports:{}};t[o][0].call(f.exports,function(e){var n=t[o][1][e];return s(n?n:e)},f,f.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(_dereq_,module,exports){
"use strict";
var Converter = _dereq_("./converter")["default"];
var View = _dereq_("./view")["default"];
var converter, view;

converter = new Converter;

view = new View;

view.onCmToInClick(converter.cmToIn);

view.onInToCmClick(converter.inToCm);

view.onFahrenheitToCelsiusClick(converter.fahrenheitToCelsius);

view.onCelsiusToFahrenheitClick(converter.celsiusToFahrenheit);
},{"./converter":2,"./view":3}],2:[function(_dereq_,module,exports){
"use strict";
var Converter,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

Converter = (function() {
  function Converter() {
    this.fahrenheitToCelsius = __bind(this.fahrenheitToCelsius, this);
    this.celsiusToFahrenheit = __bind(this.celsiusToFahrenheit, this);
    this.inToCm = __bind(this.inToCm, this);
    this.cmToIn = __bind(this.cmToIn, this);
  }

  Converter.prototype.cmToIn = function(cm) {
    if (this.isInvalid(parseFloat(cm))) {
      return NaN;
    }
    if (cm < 0) {
      return NaN;
    }
    return cm * 0.3937;
  };

  Converter.prototype.inToCm = function(inch) {
    if (this.isInvalid(parseFloat(inch))) {
      return NaN;
    }
    if (inch < 0) {
      return NaN;
    }
    return inch / 0.3937;
  };

  Converter.prototype.celsiusToFahrenheit = function(c) {
    if (this.isInvalid(parseFloat(c))) {
      return NaN;
    }
    if (c <= -273) {
      return NaN;
    }
    return c * 1.8 + 32;
  };

  Converter.prototype.fahrenheitToCelsius = function(f) {
    if (this.isInvalid(parseFloat(f))) {
      return NaN;
    }
    if (f <= -459.4) {
      return NaN;
    }
    return (f - 32) / 1.8;
  };

  Converter.prototype.isInvalid = function(input) {
    return typeof input !== 'number' || isNaN(input);
  };

  return Converter;

})();

exports["default"] = Converter;
},{}],3:[function(_dereq_,module,exports){
"use strict";
var View;

View = (function() {
  var eventHandlerGen;

  function View() {}

  eventHandlerGen = function(elId) {
    return function(cb) {
      var button;
      button = document.getElementById(elId);
      return button.addEventListener('click', this.inputToOutput(cb));
    };
  };

  View.prototype.onCmToInClick = eventHandlerGen('cm-to-in');

  View.prototype.onInToCmClick = eventHandlerGen('in-to-cm');

  View.prototype.onFahrenheitToCelsiusClick = eventHandlerGen('fahrenheit-to-celsius');

  View.prototype.onCelsiusToFahrenheitClick = eventHandlerGen('celsius-to-fahrenheit');

  View.prototype.inputToOutput = function(f) {
    return (function(_this) {
      return function() {
        var result;
        result = f(_this.inputValue());
        console.log(result);
        _this.hideError();
        if (isNaN(result)) {
          _this.showError();
        }
        return _this.output(result);
      };
    })(this);
  };

  View.prototype.inputValue = function() {
    return document.getElementById('input-value').value;
  };

  View.prototype.output = function(value) {
    return document.getElementById('output').value = value;
  };

  View.prototype.showError = function() {
    document.getElementById('input-value').classList.add('error');
    document.getElementById('input-error-message').classList.add('error');
    return document.getElementById('input-error-message').classList.remove('hide');
  };

  View.prototype.hideError = function() {
    document.getElementById('input-value').classList.remove('error');
    document.getElementById('input-error-message').classList.remove('error');
    return document.getElementById('input-error-message').classList.add('hide');
  };

  return View;

})();

exports["default"] = View;
},{}]},{},[1])
(1)
});