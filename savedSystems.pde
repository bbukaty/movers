// idea: two sets of movers with different rules, two competing shapes
void systemStep() {
  polygonBounce(8);
  // simpleParticles(4);
}

void polygonBounce(int granularity) {
  // GRANULAR PHYSICS STEP 
  checkBounces(0.6);
  kinematicsUpdate(1.0/granularity);

  //DRAW
  // fadeScreen(3, 3);
  // fadeScreen(50, 40);
  noStroke();
  float r = triangleWave(0, 255, 100*granularity, 0);
  float g = triangleWave(0, 255, 120*granularity, 0);
  fill(r, g, 200, 30);
  // drawPolygon();
  drawCurve();

  // SYSTEM UPDATE STEP
  if (frameCount % granularity == 0) {
    chaseNext(0.3);
    // scaleVels(0.99);
  }
}

void simpleParticles(int granularity) {
  fadeScreen(2, 10);
  noStroke();
  fill(140);
  drawCircles(10);

  checkBounces(0.6);
  kinematicsUpdate(1.0/granularity);

  if (frameCount % granularity == 0) {
    addRandomAccel(0.5);
    scaleAccels(0.9);
  }
}

