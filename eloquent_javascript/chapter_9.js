verify(/^[mb]/,
       ["my car", "mad cats"],
       ["camper", "high art"]);

verify(/[es]$/,
       ["pop culture", "mad props"],
       ["plop"]);

verify(/[tyi]$/,
       ["ferret", "ferry", "ferrari"],
       ["ferrum", "transfer A"]);

verify(/\s/,
       ["how delicious", "spacious room"],
       ["ruinous", "consciousness"]);

verify(/[\.]/,
       ["bad punctuation ,.", "something else,"],
       ["escape the dot"]);

verify(/^\S{3,}$/,
       ["hottentottententen"],
       ["no", "hotten totten tenten"]);

verify(/^[rw]/,
       ["red platypus", "wobbling nest"],
       ["earth bed", "learning ape"]);


function verify(regexp, yes, no) {
  // Ignore unfinished exercises
  if (regexp.source == "...") return;
  yes.forEach(function(s) {
    if (!regexp.test(s))
      console.log("Failure to match '" + s + "'");
  });
  no.forEach(function(s) {
    if (regexp.test(s))
      console.log("Unexpected match for '" + s + "'");
  });
  var results = yes.map(function(text) {
    return regexp.test(text);
  });

  return(results);
}





var text = "'I'm the cook,' he said, 'it's my job.'";
// Change this call.
text.replace(/'(?=[\si])|'$/ig, '"');
// → "I'm the cook," he said, "it's my job."

