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
    
    it("pops that item back", function () {
      expect(stack.pop()).toEqual(someItem);
    })
    
    describe("then pushing another item", function () {
      var nextItem = "another thing";
      
      beforeEach(function () {
        stack.push(nextItem);
      });
      
      it("pops that new item back first", function () {
        expect(stack.pop()).toEqual(nextItem);
      });

      it("second pop gets the original item", function () {
        stack.pop();
        expect(stack.pop()).toEqual(someItem);
      });
    });
    
  });
  
  it("cannot pop on empty", function () {
    var e = new DataStructures.StackEmptyException()
    expect(function () { stack.pop(); }).toThrow(e);
  });
});