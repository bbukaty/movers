void spawnCircle() {
  float radius = min(width, height) * 0.2;
  float sectorAngle = 2*PI / NUM_MOVERS;
  for (int i = 0; i < NUM_MOVERS; i++) {
    float currAngle = i * sectorAngle;
    movers[i] = new Mover(width/2 + radius * cos(currAngle), height/2 + radius * sin(currAngle));
  }
}

void spawnRandom() {
  for (int i = 0; i < NUM_MOVERS; i++) {
    movers[i] = new Mover(random(width), random(height));
  }
}