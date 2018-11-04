class SimpleParticleSystem extends MoverSystem {
  // TODO: make circle class extending Mover with radius?
  float radius;
  int granularity;

  void init() {
    spawnRandom(10);
    radius = 10;
    granularity = 4;
  }

  void spawnRandom(int numParticles) {
    for (Pair vertex : getRandomVertices(numParticles)) {
      movers.add(new Mover(vertex));
    }
  }

  void addRandomAccel(float rangeStart, float rangeEnd) {
    Mover m;
    for (int i = 0; i < movers.size(); i++) {
      m = movers.get(i);
      m.accel.x += random(rangeStart, rangeEnd);
      m.accel.y += random(rangeStart, rangeEnd);
    }
  }

  void updateSystem() {
    checkBounces(0, 0.6);
    kinematicsUpdate(1.0/granularity);

    if (frameCount % granularity == 0) {
      addRandomAccel(-0.5, 0.5);
      scaleAccels(0.9);
    }
  }

  void drawSystem() {
    fadeScreen(2, 10);
    noStroke();
    fill(140);
    for (Mover m : movers) {
      ellipse(m.pos.x, m.pos.y, radius, radius);
    }
  }
}

class TenuousConnections extends SimpleParticleSystem {
  float maxDistance = height/4;
  
  void init() {
    spawnRandom(40);
    granularity = 8;
  }

  void drawSystem() {
    // fadeScreen(2, 10);
    background(255);

    noFill();
    for (int i = 0; i < movers.size(); i++) {
      for (int j = i; j < movers.size(); j++) {
        Mover a = movers.get(i);
        Mover b = movers.get(j);
        float distanceFactor = max(0, 1 - a.distanceTo(b) / maxDistance);
        strokeWeight(3);
        strokeCap(SQUARE);
        stroke(0, distanceFactor * 255);
        line(a.pos.x, a.pos.y, b.pos.x, b.pos.y);
      }
    }
  }
}