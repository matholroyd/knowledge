if (typeof Object.create !== 'function') {
  Object.create = function (obj) {
    "use strict";
    var F = function () {};
    F.protoype = obj;
    return new F();
  };
}

var person = {
  first_name: "bob"
};

var other = Object.create(person);

console.log(person.first_name);
console.log(other.first_name);

other.first_name = "new";
console.log(person.first_name);
console.log(other.first_name);

person.second_name = "smith";
console.log(person.second_name); 
console.log(other.second_name);

(function () {
  "use strict";
  console.log("I was called!");
}());