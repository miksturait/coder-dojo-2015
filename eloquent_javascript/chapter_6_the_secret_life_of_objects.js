// 6.1

var StretchCell, TextCell, Vector, sc;

Vector = function(x, y) {
  this.x = x;
  this.y = y;
  return this;
};

Vector.prototype.plus = function(numbers) {
  return new Vector(this.x + numbers.x, this.y + numbers.y);
};

Vector.prototype.minus = function(numbers) {
  return new Vector(this.x - numbers.x, this.y - numbers.y);
};

new Vector(1, 2).plus(new Vector(2, 3));

new Vector(1, 2).minus(new Vector(2, 3));

Object.defineProperty(Vector.prototype, "length", {
  get: function() {
    return Math.sqrt(this.x * this.x + this.y * this.y);
  }
});

Vector.prototype.length = function() {
  return sqrt(x * x + y * y);
};

new Vector(3, 4).length;


// 6.2

TextCell = function(text) {
  this.text = text.split('\n');
  return this;
};

StretchCell = function(inner, width, height) {
  this.inner = inner;
  this.width = width;
  return this.height = height;
};

StretchCell.prototype.minWidth = function() {
  return Math.max(this.inner.minWidth(), this.width);
};

StretchCell.prototype.minHeight = function() {
  return Math.max(this.inner.minHeight(), this.height);
};

sc = new StretchCell(new TextCell("abc"), 1, 2);

StretchCell.prototype.draw = function(width, height) {
  return this.inner.draw(width, height);
};
