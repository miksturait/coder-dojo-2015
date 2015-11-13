/*function MultiplicatorUnitFailure() {}

function primitiveMultiply(a, b) {
  if (Math.random() < 0.2)
    return a * b;
  else
    throw new MultiplicatorUnitFailure();
}

function reliableMultiply(a, b) {
  try {
    return primitiveMultiply(a, b);
  } catch(error) {
    if (error instanceof MultiplicatorUnitFailure) {
      return reliableMultiply(a, b);
    } else {
       throw error;
    }

  }
}

reliableMultiply(3, 8);
// → 64

//primitiveMultiply(1, 4);
*/

var box = {
  locked: true,
  unlock: function() { this.locked = false; },
  lock: function() { this.locked = true;  },
  _content: [],
  get content() {
    if (this.locked) throw new Error("Locked!");
    return this._content;
  }
};

function withBoxUnlocked(body) {
  if(box.locked){
    box.unlock();
  }

  try {
    return body()
  } finally {
    box.lock();
  }
}

withBoxUnlocked(function() {
  box.content.push("gold piece");
});

try {
  withBoxUnlocked(function() {
    throw new Error("Pirates on the horizon! Abort!");
  });
} catch (e) {
  console.log("Error raised:", e);
}
box.locked
// → true
