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


