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
