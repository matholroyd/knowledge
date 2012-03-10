// Method invocation
// `this` is bound to the object

var someObject = {
  value: 0,
  increment: function (inc) {
    "use strict";
    this.value += inc;
  }
};


console.log(someObject.value);
someObject.increment(10); 
console.log(someObject.value);

// Funcitonal invocation
// `this` bound to global, unless added "use strict" to cause an error

someObject.double = function () {
  "use strict";
  
  var that = this,
      helper;

  helper = function(a, b) {
    that.value = that.value + that.value;
  };
  
  helper();
};

someObject.double();
console.log(someObject.value);

// Constructor invocation

var Quo = function(s) {
  "use strict";
  this.status = s;
  this.some_other_method = "blah";
};

Quo.prototype.get_status = function () {
  "use strict";
  return this.status;
};

var myQuo = new Quo("running");

console.log(myQuo.get_status());
console.log(myQuo.status);
console.log(myQuo.some_other_method);

try {
  Quo.get_status();
} catch (error) {
  console.log("get_status function does not exist on Quo");
}

// Return statement weirdness

var Trickiness = function (something) {
  "use strict";
  return something;
};

Trickiness.prototype.name = "Trickiness";

var trickyNoObject = new Trickiness("this is not an object");
var trickyWithObject = new Trickiness({name: "Not Trickiness!"});

console.log(trickyNoObject.name);
console.log(trickyWithObject.name);



// Apply invocation

var otherStatusObject = {
  status: "a-OK"
};

console.log(myQuo.get_status.apply(otherStatusObject, []));
console.log(Quo.prototype.get_status.apply(otherStatusObject, []));


// Closure to get private methods

var incrementer =  (function () {
  "use strict";
  
  var value = 0;
  
  return {
    get_value: function () {
      return value;
    },
    increment: function (inc) {
      value += inc;
      return value;
    }
  };
  
}());

console.log(incrementer.get_value());
incrementer.increment(1);
console.log(incrementer.get_value());


var quo = function(status) {
  "use strict";
  
  return {
    get_status: function () {
      return status;
    }
  };
};

var myQuo = quo("running (status private via a closure)");
console.log(myQuo.get_status());



