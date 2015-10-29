function chessBoard(size, chars) {
  var result = "";
  for (var i = 1; i <= size*size; i++) {
    result += chars[i % chars.length];
    if((i % size) == 0) {
      result += "\n";
      if((size % chars.length) == 0) {
        chars = [chars[1], chars[0]];
      }
    }
  }
  return(result);
}

console.log(chessBoard(8, ["0", "X"]));

min = (a, b) => (a < b) ? a : b;

min(1,5);
