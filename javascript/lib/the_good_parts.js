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

  Function.method('inherits', function (Parent) {
    this.prototype = new Parent();
    return this;
  });
  
  if (typeof Object.create !== 'function') {
    Object.create = function (obj) {
      var F = function () {};
      F.protoype = obj;
      return new F();
    };
  }
  
  
  Object.method('superior', function(name) {
    var that = this,
        method = that[name];

    return function () {
      return method.apply(that, arguments);
    };
  });
  
  
  // Need to check this
  // Object.method('is_array', function () {
  //   return Object.prototype.toString.apply(this) === '[object Array]';
  // };
  
  Number.method('integer', function () {
    return Math[this < 0 ? 'ceil' : 'floor'](this);
  });
  
  String.method('trim', function () {
    return this.replace(/^\s+|\s+$/g, '');
  });

};

