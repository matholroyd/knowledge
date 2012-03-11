exports.memoizer = function(memo, formula) {
  "use strict";

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