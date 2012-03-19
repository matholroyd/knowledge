exports.StackEmptyException = function () {
  return {
    message: "Cannot pop() an empty stack"
  };
};


exports.Stack = function () {
  var items = []
      that = {};
  
  that.items = function () {
    return items;
  };
  
  that.isEmpty = function () {
    return items.length == 0;
  };
  
  that.push = function(item) {
    items.push(item);
  };
  
  that.pop = function() {
    if(!that.isEmpty()) {
      return items.pop();
    } else {
      throw new exports.StackEmptyException()
    }
  }
  
  return that;
};


