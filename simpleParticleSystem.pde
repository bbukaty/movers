class SimpleParticleSystem extends MoverSystem {
  int granularity = 4;
  float radius = 10;

  void init() {
    spawnRandom(10);
    background(255);
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

class TenuousConnections extends MoverSystem {
  int granularity = 16;
  float maxDistance = height/4;
  
  void init() {
    spawnRandom(20);
    background(0);
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
    fadeScreen(4, 1);
    // background(255);

    noFill();
    for (int i = 0; i < movers.size(); i++) {
      // beginShape();
      for (int j = i; j < movers.size(); j++) {
        Mover a = movers.get(i);
        Mover b = movers.get(j);
        float distanceFactor = max(0, 1 - a.distanceTo(b) / maxDistance);
        strokeWeight(3);
        strokeCap(SQUARE);
        fill(distanceFactor * 255);
        stroke(0, distanceFactor * 255);
        line(a.pos.x, a.pos.y, b.pos.x, b.pos.y);
      }
      // endShape();
    }
  }
}

