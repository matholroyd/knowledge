"use stict";

var DataStructures = require('./data_structures.js');

describe("stack", function () {
  var stack;
  
  beforeEach(function () {
    stack = new DataStructures.Stack();
  });
  
  it("starts empty", function () {
    expect(stack.isEmpty()).toBeTruthy();
  });

  describe("pushing an item", function () {
    var someItem = 99;
    
    beforeEach(function () {
      stack.push(someItem);
    });
    
    it("stack is not empty", function () {
      expect(stack.isEmpty()).toBeFalsy();
    });
    
  });
  
  it("canot pop on empty", function () {
    
  });
});