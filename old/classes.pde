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

class Polygon extends Mover {
  int vertices;
  float size;
  float rotation;
  
  Polygon(float startX, float startY, int n,
        float startSize, float startRotation) {
    super(startX, startY);
    vertices = n;
    size = startSize;
    rotation = startRotation;
  }
  
  void drawSelf(boolean curve) {
    float sectorAngle = 2.0 * PI / vertices;
    int numIters = vertices;
    if (curve) numIters += 3;
    beginShape();
    for (int i = 0; i < numIters; i++) {
      float vertX = pos.x + size * cos(rotation + sectorAngle*i);
      float vertY = pos.y + size * sin(rotation + sectorAngle*i);
      if (curve) curveVertex(vertX, vertY);
      else vertex(vertX, vertY);
    }
    endShape();
  }
  
}
