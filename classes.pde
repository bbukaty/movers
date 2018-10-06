class Pair {
  float x;
  float y;

  Pair(float startX, float startY) {
    x = startX;
    y = startY;
  }

  void add(Pair toAdd) {
    x += toAdd.x;
    y += toAdd.y;
  }

  void scale(float c) {
    x *= c;
    y *= c;
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
