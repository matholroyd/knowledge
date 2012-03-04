var chapter10 = require('./chapter-10.js');

describe("Reverse Polish Notation", function() {
  it("1 2 + => 3", function() {
    expect(chapter10.solveRPN("1 2 +")).toEqual(3);
  });

  it("2 5 *  => 10", function() {
    expect(chapter10.solveRPN("2 5 *")).toEqual(10);
  });

  it("2 3 * 5 +  => 11", function() {
    expect(chapter10.solveRPN("2 3 * 5 +")).toEqual(11);
  });

  describe("with dodgy input", function() {
    it("can handle too many spaces", function () {
      expect(chapter10.solveRPN(" 2    5   *")).toEqual(10);
    });
  });

});