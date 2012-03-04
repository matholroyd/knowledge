var chapter10 = require('./chapter-10.js');

describe("Reverse Polish Notation", function() {
  it("1 2 + => 3", function() {
    expect(chapter10.solveRPN("1 2 +")).toEqual(3);
  });
});