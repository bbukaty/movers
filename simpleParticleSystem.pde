class SimpleParticleSystem extends MoverSystem {
  float radius = 10;
  int numParticles = 10;
  int granularity = 4;  

  SimpleParticleSystem() {
    // TODO: make circle class extending Mover with radius
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
    checkBounces(0.6);
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
