exports.solveRPN = function(equation) {
  var get_operator = function(op) {
    switch(op) {
      case '+': 
        return function(a, b) { return a + b; }
      case '*':
        return function(a, b) { return a * b; }
    }
  }
  
  var terms = equation.split(' '),
      a = parseFloat(terms[0]),
      b = parseFloat(terms[1]),
      op = get_operator(terms[2]);
  
  return op(a, b);
};