function ArraySeq(array) {
  this.array = array;
  this.position = -1;
}

ArraySeq.prototype.getNext = function() {
  if (this.position < this.array.length) {
    this.position++;
  }

  return this.array(this.position);
};

var al = new ArraySeq([1, 2]);


console.log(al.getNext());