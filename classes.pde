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
  int capacity = 10;
  
  Pair[] coords;
  int numVertices;
  int modIndex;

  Pair pos;
  Pair vel;
  Pair accel;

  Mover(float startX, float startY) {
    coords = new Pair[capacity];
    numVertices = 0;
    modIndex = 0;
    
    pos = new Pair(startX, startY);
    vel = new Pair(0, 0);
    accel = new Pair(0, 0);

    addPoint(startX, startY);
  }

  void addPoint(float x, float y) {
    if (numVertices < capacity) {
      coords[numVertices] = new Pair(x, y);
      numVertices++;
    } else {
      coords[modIndex] = new Pair(x, y);
      modIndex = (modIndex + 1) % capacity;
    }
  }

  void drawSelf() {
    strokeWeight(20);
    stroke(255);
    noFill();
    
    beginShape();
    curveVertex(coords[0].x, coords[0].y);
    int index;
    for (int i=0; i < numVertices; i++) {
      index = (modIndex + i) % capacity;
      curveVertex(coords[index].x, coords[index].y);
    }
    endShape();
  }

}
