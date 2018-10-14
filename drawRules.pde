// Functions that draw things on the screen based on the positions of all the movers,
// and a few drawing helper functions.

void drawCircle(Pair pos, float radius) {
  ellipse(pos.x, pos.y, radius, radius);
}

void drawCircles(float radius) {
  for (int i=0; i < movers.length; i++) {
    drawCircle(movers[i].pos, radius);
  }
}

void fadeScreen(int interval, float alpha) {
  if (frameCount % interval == 0) {
    noStroke();
    fill(255, alpha);
    rect(0, 0, width, height);
  }
}

float triangleWave(int low, int high, int period, int offset) {
  float amp = float(high - low);
  float slope = 2 * amp / period;
  int t = frameCount % period + offset;
  if (t < period / 2) {
    return slope * t;
  } else {
    return 2 * amp - slope * t;
  }
}

float rangeSin(int low, int high, int period, int offset) {
  return 0;
}

void drawPolygon() {
  beginShape(QUADS);
  Mover m;
  for (int i=0; i < movers.length + 1; i++) {
    m = movers[(i + 1) % movers.length];
    vertex(m.pos.x, m.pos.y);
  }
  endShape();
}

void drawCurve() {
  beginShape();
  Mover m;
  for (int i=0; i < movers.length + 3; i++) {
    m = movers[(i + 1) % movers.length];
    curveVertex(m.pos.x, m.pos.y);
  }  
  endShape();
}
