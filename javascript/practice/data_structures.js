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


exports.BinaryTree = function (parentNode) {
  var value = null,
      leftNode = null,
      rightNode = null,
      that = {},
      withLeftNode,
      withRightNode,
      findNode,
      findNodeChain;

  if(parentNode === undefined) {
    parentNode = null;
  }

  withLeftNode = function(item) {
    if(leftNode === null) {
      leftNode = new exports.BinaryTree(that);
    }
    return leftNode;
  };

  withRightNode = function(item) {
    if(rightNode === null) {
      rightNode = new exports.BinaryTree(that);
    }
    return rightNode;
  };
  
  findNode = function(item) {
    var result = null,
        node = findNodeChain(item);
    
    if(node !== null) {
      result = node[node.length - 1];
    }
    
    return result;
  };
  
  findNodeChain = function (item) {
    var chain = [],
        found = false,
        node = that;

    while(!found && node !== null) {
      chain.push(node);
    
      if(node.value() === item) {
        found = true;
      } else {
        if(item < node.value()) {
          node = node.left();
        } else if(item > node.value()) {
          node = node.right();
        }
      }
    }
    
    if(found) {
      return chain;
    } else {
      return null;
    }
  };
  
  that.nodes = function () {
    var result = [];
    if(value !== null) {
      if(leftNode !== null) {
        result = result.concat(leftNode.nodes());
      }
      result = result.concat([that]);
      if(rightNode !== null) {
        result = result.concat(rightNode.nodes());
      }
    }
    
    return result;
  };
  
  that.values = function () {
    var result = [],
        i,
        ns = that.nodes();
        
    for(i = 0; i < ns.length; i += 1) {
      result.push(ns[i].value());
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
      result = that;
    } else {
      result = leftNode.leftMost();
    }
    
    return result;
  };

  that.rightMost = function () {
    var result;
    
    if(rightNode === null) {
      result = that;
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
  
  that.isLeaf = function() {
    return leftNode === null && rightNode === null;
  }
  
  that.isLeft = function() {
    return parentNode !== null && parentNode.left() == that;
  }

  that.isRight = function() {
    return parentNode !== null && parentNode.right() == that;
  }
  
  that.parent = function() {
    return parentNode;
  }
  
  that.removeSelfAndChildren = function() {
    if(parentNode !== null) {
      if(parentNode.left() == that) {
        parentNode.deleteLeft();
      } else {
        parentNode.deleteRight();
      }
    }
  }
  
  that.attachLeft = function(node) {
    leftNode = node;
  }
  
  that.attachRight = function(node) {
    rightNode = node;
  }
  
  that.deleteLeft = function () {
    leftNode = null;
  };

  that.deleteRight = function () {
    rightNode = null;
  };
  
  that.delete = function (item) {
    var newNode = null,
        node = findNode(item),
        parent = node.parent();

    node.removeSelfAndChildren();
    
    if(node.left() !== null) {
      newNode = node.left().rightMost();
    } else if(node.right() !== null){
      newNode = node.right().leftMost();
    }
    if(newNode !== null) {
      newNode.removeSelfAndChildren();
      if(parent !== null && newNode !== null) {
        if(newNode.value() < parent.value()) {
          parent.attachLeft(newNode);
        } else {
          parent.attachRight(newNode);
        }
      }
    }
    
    // node.left(). ttachRight
    
    // var node = null, 
    //     parent = null, 
    //     matchToRoot = findNodeChain(item).reverse();
    // 
    // // if(matchToRoot !== null) {
    //   node = matchToRoot[0];
    //   parent = matchToRoot[1];
    //   
    //   if(parent.left() === node) {
    //     parent.deleteLeft();
    //     if(node.left() !== null) {
    //       node.left().rightMost()
    //     }
    //   } else {
    //     // parent.right();
    //   }
    // // }
  };
  
  that.value = function () {
    return value;
  }

  return that;  
};

