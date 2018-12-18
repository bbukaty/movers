class ShiftingPolygon extends MoverSystem {
  int granularity = 4;

  void drawPolygon() {
    beginShape();
    Mover m;
    for (int i=0; i < movers.size() + 1; i++) {
      m = movers.get((i + 1) % movers.size());
      vertex(m.pos.x, m.pos.y);
    }
    endShape();
  }

  void drawCurve() {
    beginShape();
    Mover m;
    for (int i=0; i < movers.size() + 3; i++) {
      // +3 loops around to the beginning to close curve
      m = movers.get((i + 1) % movers.size());
      curveVertex(m.pos.x, m.pos.y);
    }  
    endShape();
  }

  void init() {
    spawnRandom(4);
    background(255);
  }

  void updateSystem() {
    checkBounces(0, 0.6);
    kinematicsUpdate(1.0/granularity);

    if (frameCount % granularity == 0) {
      // addRandomAccel(-0.5, 0.5);
      chaseNext(0.3);
      scaleAccels(0.9);
    }
  }

  void drawSystem() {
    // fadeScreen(3, 3);
    // fadeScreen(50, 40);
    noStroke();
    float r = triangleWave(0, 255, 600, 70);
    float g = triangleWave(0, 255, 720, 0);
    fill(r, g, 200, 25);
    // drawCurve();
    drawPolygon();
  }
}