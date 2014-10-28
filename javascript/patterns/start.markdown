# Objects

- Every _function_ has a prototype property
- Avoid `==` etc, as they type cast. Always use e.g. `===`
 
# Cheatsheet
    
    "use strict";
    
    parseInt(x, 10);
    Number("08") // returns NaN
 
    for (var i = 0, max = myarray.length; i < max; i++) {
      // do something with myarray[i] 
    }

    var i = 0,
        max,
        myarray = [];
    // ...
    for (i = 0, max = myarray.length; i < max; i++) {
      // do something with myarray[i] 
    } 
 
 
    var i, 
        myarray = [];
    for (i = myarray.length; i--;) {
      // do something with myarray[i] 
    }
    
    var myarray = [],
        i = myarray.length;
    while (i--) {
      // do something with myarray[i] 
    }
    
    for (var i in man) {
      if (man.hasOwnProperty(i)) { // filter
        console.log(i, ":", man[i]);
      }
    }
    
    var i,
        hasOwn = Object.prototype.hasOwnProperty;
    for (i in man) {
      if (hasOwn.call(man, i)) { // filter
        console.log(i, ":", man[i]); 
      }
    }
    
    // Warning: doesn't pass JSLint 
    var i,
        hasOwn = Object.prototype.hasOwnProperty;
    for (i in man) if (hasOwn.call(man, i)) { // filter
      console.log(i, ":", man[i]); 
    }
    
    var inspect_me = 0, 
        result = '';
    switch (inspect_me) {
    case 0:
      result = "zero";
      break; 
    case 1:
      result = "one";
      break; 
    default:
      result = "unknown"; 
    }