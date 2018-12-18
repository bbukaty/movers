String timestamp() {
  return str(month()) + "-"  +
  str(day()) + "_" +
  str(hour()) + "-" +
  str(minute()) + "-" +
  str(second()) + "-" + 
  str(millis());
}

ArrayList<Pair> getPolygonVertices(int n, float radius, float startAngle) {
  ArrayList<Pair> vertices = new ArrayList<Pair>();
  float sectorAngle = 2.0*PI / n;
  for (int i = 0; i < n; i++) {
    float currAngle = startAngle + i * sectorAngle;
    float x = width/2 + radius * cos(currAngle);
    float y = height/2 + radius * sin(currAngle);
    vertices.add(new Pair(x, y));
  }
  return vertices;
}

ArrayList<Pair> getRandomVertices(int n) {
  ArrayList<Pair> vertices = new ArrayList<Pair>();
  for (int i = 0; i < n; i++) {
    vertices.add(new Pair(random(width), random(height)));
  }
  return vertices;
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
    return 2.0 * amp - slope * t;
  }
}

float rangeSin(int low, int high, int period, int offset) {
  return 0; // TODO
}