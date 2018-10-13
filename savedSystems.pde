// idea: two sets of movers with different rules, two competing shapes
void systemStep() {
  
  // polygonBounce();
  simpleParticles();
}

void polygonBounce() {
  // fadeScreen(3, 3);
  // fadeScreen(50, 40);
  noStroke();
  float r = triangleWave(0, 255, 10, 0);
  float g = 140;//triangleWave(0, 255, 512, 0);

  fill(r, g, 200, 50);
  // drawPolygon();
  drawCurve();

  chaseNext(0.3);
  // scaleVels(0.99);

  checkBounces(0.6);
  kinematicsUpdate();
}

void simpleParticles() {
  fadeScreen(2, 10);
  noStroke();
  fill(140);
  drawCircles(10);

  checkBounces(0.6);
  addRandomAccel(0.5);
  kinematicsUpdate();
  scaleAccels(0.9);
}

