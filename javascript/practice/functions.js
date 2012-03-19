"use strict";

// Method invocation
// `this` is bound to the object

var someObject = {
  value: 0,
  increment: function (inc) {
    this.value += inc;
  }
};


console.log(someObject.value);
someObject.increment(10); 
console.log(someObject.value);

// Funcitonal invocation
// `this` bound to global, unless added "use strict" to cause an error

someObject.double = function () {
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
  this.status = s;
  this.some_other_method = "blah";
};

Quo.prototype.get_status = function () {
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
  return something;
};

Trickiness.myProperty = "Trickiness";
Trickiness.prototype.myProperty = "Trickiness prototype.name";

var trickyNoObject = new Trickiness("this is not an object");
var trickyWithObject = new Trickiness({myProperty: "Not Trickiness!"});

console.log(trickyNoObject.myProperty);
console.log(trickyWithObject.myProperty);



// Apply invocation

var otherStatusObject = {
  status: "a-OK"
};

console.log(myQuo.get_status.apply(otherStatusObject, []));
console.log(Quo.prototype.get_status.apply(otherStatusObject, []));


// Closure to get private methods

var incrementer =  (function () {
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
  return {
    get_status: function () {
      return status;
    }
  };
};

var myQuo = quo("running (status private via a closure)");
console.log(myQuo.get_status());

// Avoiding functions within loops

var array = [{}, {}, {}];
var add_helper_function = function (array) {
  var i, helper;
  
  helper = function (x) {
    return function () {
      console.log(x);
    };
  };

  for (i = 0; i < array.length; i += 1) {
    array[i].number = helper(i);
  }
};

add_helper_function(array);
array[1].number();

// Memoization

var fibonnaci = (function () {
  var previousFib2,
      fib, temp;
      
  fib = function (x) {
    var result;
    
    if (x === 1) {
      previousFib2 = 1;
      result = 1;
    } else {
      temp = fib(x - 1);
      result = previousFib2 + temp;
      previousFib2 = temp;
    }
    return result;
  };
  
  return fib;
}());

var fibonnaci = (function () {
  var memo = [0, 1],
      fib;
      
  fib = function (x) {
    // console.log("Calling fibonnaci!");
    var result = memo[x];

    if (typeof(result) === 'undefined') {
      result = fib(x-2) + fib(x-1);
      memo[x] = result;
    }

    return result;
  };
  
  return fib;
}());

var i;

for(i = 0; i <= 5; i +=1) {
  console.log("fibonnaci " + i + ": " + fibonnaci(i));
}

// Memoizer

var memoizer = function (memo, formula) {
  var recur;
  
  recur = function (x) {
    var result = memo[x];
    
    if (typeof result === 'undefined') {
      result = formula(recur, x);
      memo[x] = result;
    }
    
    return result;
  };
  
  return recur;
};

var memoizedFib = memoizer([0, 1], function(recur, x) {
  return recur(x-2) + recur(x-1);
});

for(i = 0; i <= 5; i +=1) {
  console.log("fibonnaci " + i + ": " + memoizedFib(i));
}

var memoizedFactorial = memoizer([1], function(recur, x) {
  return x * recur(x - 1);
});

for(i = 0; i <= 5; i +=1) {
  console.log("facorial " + i + ": " + memoizedFactorial(i));
}

var squareRooter = function(num) {
  var appoximation = memoizer([num/2], function(recur, x) {
    var xn = recur(x-1);
    return (xn + (num/xn)) / 2;
  });
  
  return appoximation;
};

var squareRootFor123456 = squareRooter(123456);

for(i = 0; i <= 5; i +=1) {
  console.log("square root approixmation for 123456 " + i + "th: " + squareRootFor123456(i));
}
