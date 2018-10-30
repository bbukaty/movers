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

class Polygon {
  Mover center;
  float size;
  float rotation;
  int n;
  
  Polygon(float startX, float startY, int vertices,
        float startSize, float startRotation) {
    center = new Mover(startX, startY);
    n = vertices;
    size = startSize;
    rotation = startRotation;
  }
  
  void drawSelf(boolean curve) {
    float sectorAngle = 2.0 * PI / n;
    int numIters = n;
    if (curve) numIters += 2;
    beginShape();
    for (int i = 0; i < numIters; i++) {
      float vertX = center.pos.x + size * cos(rotation + sectorAngle*i);
      float vertY = center.pos.y + size * sin(rotation + sectorAngle*i);
      if (curve) curveVertex(vertX, vertY);
      else vertex(vertX, vertY);
    }
    endShape();
    
  }
  
}
