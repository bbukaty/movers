// Functions that draw things on the screen based on the positions of all the movers,
// and a few drawing helper functions.

void drawCircle(Pair pos, float radius) {
  ellipse(pos.x, pos.y, radius, radius);
}

void drawCircles(float radius) {
  noStroke();
  fill(100);
  for (int i=0; i < movers.length; i++) {
    drawCircle(movers[i].pos, radius);
  }
}

void fadeScreen(int alpha) {
  noStroke();
  fill(255, alpha);
  rect(0, 0, width, height);
}

// returns coordinates of a random radial offshoot from x, y 
Pair randomOffshoot(Pair pos, float angle, float minDist, float maxDist) {
  float radius = minDist + random(maxDist-minDist);
  return new Pair(pos.x + radius*cos(angle), pos.y + radius*sin(angle));
}

void crazyRing(Pair pos, float radius) {
  float wobble = 0;
  int numVertices = 5;

  Pair[] vertices = new Pair[numVertices];
  
  // generate curve vertices
  for (int i=0; i < numVertices; i++) {
    vertices[i] = randomOffshoot(pos, random(2*PI), radius - wobble, radius + wobble);
  }
  
  // draw
  noFill();
  stroke(0);
  strokeWeight(1);
  
  beginShape();
  Pair vert;
  for (int i=0; i < numVertices; i++) {
    vert = vertices[i];
    curveVertex(vert.x, vert.y);
  }
  // close the loop smoothly by repeating beginning control points
  for (int i=0; i < 3; i++) {
    vert = vertices[i];
    curveVertex(vert.x, vert.y);
  }
  endShape();
}
