// Your code here.

function arrayToList(array){
  var output = null;
  for (var i = array.length-1; i >= 0; i--){
    output = prepend(array[i], output);
  }
  return output;
}

function prepend(value, list){
  return {value: value, rest: list};
}

[1,2].push(5);

function listToArray(list) {
  var collection = [];

  function recuring(list, collection) {
    collection.push(list.value);
    if (list.rest != null) {
     return(recuring(list.rest, collection));
    } else {
     return(collection)
    }
  }

  return(recuring(list, collection));
}

function nth(list, index) {
  if (index == 0) {
    return(list.value)
  } else {
    return(nth(list.rest, --index))
  }
}

arrayToList([10, 20]);
// → {value: 10, rest: {value: 20, rest: null}}
listToArray(arrayToList([10, 20, 30]));
// → [10, 20, 30]
prepend(10, prepend(20, null));
// → {value: 10, rest: {value: 20, rest: null}}
nth(arrayToList([10, 20, 30]), 1);
// → 20