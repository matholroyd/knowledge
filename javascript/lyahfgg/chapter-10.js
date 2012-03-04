var theGoodParts = require('../lib/the_good_parts.js'),
    _und = require("underscore");

theGoodParts.crockify();

exports.solveRPN = function(equation) {
  var get_operator = function(op) {
    switch(op) {
      case '+': 
        return function(a, b) { return a + b; }
      case '*':
        return function(a, b) { return a * b; }
      default:
        return false;
    }
  }
  
  var terms = equation.trim().split(/\s+/),
      stack = [];
      
  _und.each(terms, function(t) {
    if(get_operator(t)) {
      var b = stack.pop(),
          a = stack.pop(),
          op = get_operator(t);
      stack.push(op(a, b));
    } else {
      stack.push(parseFloat(t))
    }
  });
  
  return stack.pop();
};