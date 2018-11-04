class Pair {
  float x;
  float y;

  Pair(float startX, float startY) {
    x = startX;
    y = startY;
  }

  Pair() {
    x = 0;
    y = 0;
  }

  Pair plus(Pair toAdd) {
    return new Pair(x + toAdd.x, y + toAdd.y);
  }

  Pair scale(float c) {
    return new Pair(x*c, y*c);
  }

  Pair normalize() {
    return scale(1 / magnitude());
  }

  float magnitude() {
    return sqrt(x*x + y*y);
  }

  // more helpers here could allow for interesting experiments
}

class Mover {
  Pair pos;
  Pair vel;
  Pair accel;

  Mover(Pair startPos) {
    pos = startPos;
    vel = new Pair(0, 0);
    accel = new Pair(0, 0);
  }

  Mover(float startX, float startY) {
    this(new Pair(startX, startY));
  }
  // TODO: builder pattern (?)
  
  void setPos(float newX, float newY) {
    pos.x = newX;
    pos.y = newY;
  }

  float distanceTo(Mover m) {
    return m.pos.plus(pos.scale(-1)).magnitude();
  }
}
