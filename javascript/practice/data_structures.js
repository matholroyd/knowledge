
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
  
  return that;
};
