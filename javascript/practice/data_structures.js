"use strict";

exports.StackEmptyException = function () {
  return {
    message: "Cannot pop() an empty stack"
  };
};


exports.Stack = function () {
  var items = [],
      that = {};
  
  that.items = function () {
    return items;
  };
  
  that.isEmpty = function () {
    return items.length == 0;
  };
  
  that.push = function(item) {
    items = items.concat([item]);
  };
  
  that.pop = function() {
    var popped;
    
    if(!that.isEmpty()) {
      popped = items.splice((items.length - 1), 1);
      return popped[0];
    } else {
      throw new exports.StackEmptyException()
    }
  }
  
  return that;
};


exports.BinaryTree = function () {
  var value = null,
      leftNode = null,
      rightNode = null,
      that = {},
      withLeftNode,
      withRightNode;

  withLeftNode = function(item) {
    if(leftNode === null) {
      leftNode = new exports.BinaryTree();
    }
    return leftNode;
  };

  withRightNode = function(item) {
    if(rightNode === null) {
      rightNode = new exports.BinaryTree();
    }
    return rightNode;
  };

  that.values = function () {
    var result = [];
    if(value !== null) {
      if(leftNode !== null) {
        result = result.concat(leftNode.values());
      }
      result = result.concat([value]);
      if(rightNode !== null) {
        result = result.concat(rightNode.values());
      }
    }
    
    return result;
  };
  
  that.left = function () {
    return leftNode;
  };

  that.right = function () {
    return rightNode;
  };
  
  that.leftMost = function () {
    var result;
    
    if(leftNode === null) {
      result = value;
    } else {
      result = leftNode.leftMost();
    }
    
    return result;
  };

  that.rightMost = function () {
    var result;
    
    if(rightNode === null) {
      result = value;
    } else {
      result = rightNode.rightMost();
    }
    
    return result;
  };
  
  that.insert = function (item) {
    if(value === null) {
      value = item;
    } else {
      if(item < value) {
        withLeftNode().insert(item);
      } else {
        withRightNode().insert(item);
      }
    }
  };
  
  that.value = function () {
    return value;
  }

  return that;  
};

