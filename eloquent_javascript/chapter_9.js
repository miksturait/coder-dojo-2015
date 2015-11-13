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

// validating
var email_pattern = /[^@\s]+@[^\.]+\.\S{2,}$/;

email_pattern.test('aaa.saa');
email_pattern.test('tom @ale.to');
email_pattern.test('michal.czyz@mikstura.it');

// match object
var pattern = /\d+/g;
var text = "hej 123 and 22, or 543"
pattern.exec(text)[0];
pattern.exec(text)[0];
pattern.exec(text)[0];

var dateTime = /(\d{1,2})-(\d{1,2})-(\d{4})/;
dateTime.exec('13-11-2015');

// replacing
var regex = /'(?=[\si])|'$/ig // new RegExp("'(?=[\si])|'$", "ig")
var text = "'I'm the cook,' he said, 'it's my job.'";

text.replace(regex, '"');





/cat/.test("concatenate");
// → true
/\bcat\b/.test("con cat enate");
// → false
