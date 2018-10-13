class Pair {
  float x;
  float y;

  Pair(float startX, float startY) {
    x = startX;
    y = startY;
  }

  Pair add(Pair toAdd) {
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

  Mover(float startX, float startY) {
    pos = new Pair(startX, startY);
    vel = new Pair(0, 0);
    accel = new Pair(0, 0);
  }

}
