"use strict";

require('../lib/the_good_parts.js').crockify();

var Mammal = function (name) {
  this.name = name;
};

Mammal.prototype.get_name = function () {
  return this.name;
};

Mammal.prototype.says = function () {
  return this.saying || '';
};


var myMammal = new Mammal("Herb the Mamaal");
console.log(myMammal.get_name());

var Cat = function(name) {
  this.name = name;
  this.saying = "meow";
};

Cat.prototype = new Mammal();

Cat.prototype.purr = function (n) {
  var i, s = '';
  for(i = 0; i < n; i += 1) {
    if(s) {
      s += '-';
    }
    s += 'r';
  }
  
  return s;
};

var cat = new Cat("bobby");
console.log(cat.get_name());
console.log(cat.purr(10));


var Dog = function (name) {
  this.name = name;
  this.saying = "woof";
};

Dog.inherits(Mammal);

Dog.method("growl", function(n) {
  var i, s = 'G';
  for(i = 0; i < n; i += 1) {
    s += 'r';
  }
  return s;
});
  
Dog.method("get_name", function () {
  return this.says() + " " + this.name + " " + this.says();
});

var doggy = new Dog("Rex");
console.log(doggy.growl(10));
console.log(doggy.get_name());



myMammal = {
  name: "Herb the mammal",
  get_name: function () {
    return this.name;
  },
  says: function () {
    return this.saying || '';
  }
};

var myCat = Object.create(myMammal);
myCat.name = "Henritta";
myCat.saying = "meow";
myCat.purr = function (n) {

  var i, s = '';
  for(i = 0; i < n; i += 1) {
    if(s) {
      s += '-';
    }
    s += 'r';
  }
  
  return s;
};

var mammal2 = function(spec) {
  var that = {
    get_name: function () {
      return spec.name;
    },
    says: function () {
      return spec.saying || '';
    }
  };
  
  return that;
};

var cat2 = function(spec) {
  var that;
  spec.saying = spec.saying || 'meow';
  
  that = mammal2(spec);
  that.purr = function (n) {
    var i, s = '';
    for(i = 0; i < n; i += 1) {
      if(s) {
        s += '-';
      }
      s += 'r';
    }

    return s;
  };
  that.get_name = function () {
    return that.says() + " " + spec.name + " " + that.says();
  };
  
  return that;
};


var coolCat = function(spec) {
  var that, super_get_name;
  that = cat2(spec);
  super_get_name = that.superior('get_name');
  // super_get_name = that.get_name;
  
  that.get_name = function () {
    return "like " + super_get_name() + " baby!";
  };
  
  return that;
};

var mrcool = coolCat({name: "julio"});
console.log(mrcool.get_name());

// Parts

var automateDefenseSystem = function (that) {
  var guns = {};
  
  that.arm = function(weaponType, firingMethod, parameters) {
    var handler = {
      firingMethod: firingMethod,
      parameters: parameters
    };
    if (guns.hasOwnProperty(weaponType)) {
      guns[weaponType].push(handler);
    } else {
      guns[weaponType] = [handler];
    }
  };
  
  that.fire = function(weaponType) {
    var i, array, handler;
    
    if(guns.hasOwnProperty(weaponType)) {
      array = guns[weaponType];
      for(i = 0; i < array.length; i += 1) {
        handler = array[i];
        handler.firingMethod(handler.parameters);
      }
    } 
  };
  
};

automateDefenseSystem(mrcool);
mrcool.arm('pistol', function () {
  console.log("Eat lead, buddy!");
});
mrcool.arm('machete', function () {
  console.log("I'm cutting you loose!");
});
mrcool.arm('machete', function () {
  console.log("I don't mean to split hairs!");
});


mrcool.fire('pistol');
mrcool.fire('machete');







