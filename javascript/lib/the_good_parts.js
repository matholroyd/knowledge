// From Javascript the good parts

exports.crockify = function() {

  Function.prototype.method = function (name, func) {
      this.prototype[name] = func;
      return this;
  };

  Function.method('curry', function () {
      var slice = Array.prototype.slice,
          args = slice.apply(arguments),
          that = this;

      return function () {
          return that.apply(null, args.concat(slice.apply(arguments)));
      };
  });
  
  var is_array = function (value) {
    return Object.prototype.toString.apply(value) === '[object Array]';
  };
};

