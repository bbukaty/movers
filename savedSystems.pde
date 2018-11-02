// idea: two sets of movers with different rules, two competing shapes
void systemStep() {
  //polygonBounce(4);
  // simpleParticles(4);
  polygonRotate(4);
}

void polygonBounce(int granularity) {
  // GRANULAR PHYSICS STEP 
  checkBounces(0.6);
  kinematicsUpdate(1.0/granularity);

  //DRAW
  // fadeScreen(3, 3);
  // fadeScreen(50, 40);
  noStroke();
  float r = triangleWave(0, 255, 150*granularity/2, 70);
  float g = triangleWave(0, 255, 180*granularity/2, 0);
  fill(r, g, 200, 25);
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

void polygonRotate(int granularity) {
  float squareSide = 100;
  float wobbleRadius = 30;
  
  int iters = 40;
  int currIter = frameCount % iters;
  float iterAngle = 2*PI/iters;
  float currAngle = currIter * iterAngle;
  
  
  polygon.rotation = -currAngle;
  polygon.center.setPos(width/2 + wobbleRadius * cos(currAngle), height/2 + wobbleRadius * sin(currAngle));
  //polygon.center.setPos(100,100);
  
  //fadeScreen(1,10);
  noStroke();
  background(255);
  
  fill(0);
  polygon.drawSelf(true);
  rect(width/2 - polygon.size/4, height/2 + polygon.size/4, polygon.size/2, polygon.size*1.1);
  
  fill(255);
  rect(width/2 - squareSide/2, height/2 - squareSide/2, squareSide, squareSide);
  
  
  
  
  
}
