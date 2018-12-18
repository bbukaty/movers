class Pair {
  float x;
  float y;

  Pair(float startX, float startY) {
    x = startX;
    y = startY;
  }

  Pair plus(Pair toAdd) { return new Pair(x + toAdd.x, y + toAdd.y); }
  Pair scale(float c) { return new Pair(x*c, y*c); }
  Pair normalize() { return scale(1 / magnitude()); }
  float magnitude() { return sqrt(x*x + y*y); }
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

float triangleWave(float low, float high, float doneness) {
  float amp = high - low;
  float slope = 2 * amp; // need to make it to high by 0.5 doneness, not 1
  if (doneness < 0.5) {
    return low + slope * doneness;
  } else {
    return low + 2 * amp - slope * doneness;
  }
}

float sinWave(float low, float high, float doneness) {
  float amp = high - low;
  return low + amp * (1 + sin(2*PI*doneness)) / 2;
}