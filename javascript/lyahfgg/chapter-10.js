
exports.solveRPN = function(equation) {
  terms = equation.split(' ');
  a = parseFloat(terms[0]);
  b = parseFloat(terms[1]);
  operator = terms[2];
  
  return a + b;
};