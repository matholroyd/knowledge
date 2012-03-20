"use stict";

var DataStructures = require('./data_structures.js'),
    _und = require("underscore");

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


describe("binary tree", function () {
  var binary_tree;
  
  beforeEach(function () {
    binary_tree = new DataStructures.BinaryTree();
  });
  
  describe("empty tree", function () {
    it("has no values", function() {
      expect(binary_tree.values()).toEqual([]);
    });

    it("has no leaf nodes", function() {
      expect(binary_tree.left()).toBeNull();
      expect(binary_tree.right()).toBeNull();
    });
    
    describe("adding first item", function () {
      beforeEach(function () {
        binary_tree.insert(5);
      });
      
      it("puts value in root node", function () {
        expect(binary_tree.value()).toEqual(5);
      });
      
      it("leaf nodes remain empty", function () {
        expect(binary_tree.left()).toBeNull();
        expect(binary_tree.right()).toBeNull();
      });
      
      it("has only those value", function () {
        expect(binary_tree.values()).toEqual([5]);
      });
      
      describe("adding item less than root", function () {
        beforeEach(function () {
          binary_tree.insert(3);
        });

        it("left is not null", function () {
          expect(binary_tree.left()).not.toBeNull();
        });
        
        it("left has new item", function () {
          expect(binary_tree.left().value()).toEqual(3);
        });
        
        it("right remains empty", function () {
          expect(binary_tree.right()).toBeNull();
        });

        it("values returned in order", function () {
          expect(binary_tree.values()).toEqual([3, 5]);
        });
        
        describe("adding middle item", function () {
          beforeEach(function () {
            binary_tree.insert(4);
          });

          it("value added to right of left", function () {
            expect(binary_tree.left().right().value()).toEqual(4);
          });

          it("values returned in order", function () {
            expect(binary_tree.values()).toEqual([3, 4, 5]);
          });
          
        });
      });
    });
  });
  
  describe("helper functions", function () {
    beforeEach(function () {
      _und.each([4, 6, 2, 5, 7, 1, 3], function(item) {
        binary_tree.insert(item);
      });
    });
    
    describe("leftMost", function () {
      it("from root", function () {
        expect(binary_tree.leftMost().value()).toEqual(1);
      });

      it("from first right node", function () {
        expect(binary_tree.right().leftMost().value()).toEqual(5);
      });
    });

    describe("righttMost", function () {
      it("from root", function () {
        expect(binary_tree.rightMost().value()).toEqual(7);
      });

      it("from first left node", function () {
        expect(binary_tree.left().rightMost().value()).toEqual(3);
      });
    });

    describe("deleting", function () {
      // it("removes the node if leaf", function () {
      //   binary_tree.delete(1);
      //   expect(binary_tree.left().left()).toBeNull();
      // });
    });

  });
  
    
});