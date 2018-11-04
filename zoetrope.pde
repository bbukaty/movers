class Zoetrope extends MoverSystem {
  
  int iters = 40;
  float iterAngle = 2*PI/iters;

  Polygon polygon = new Polygon(width/2, height/2, 3, 60, 0);
  float squareSide = 0.5 * polygon.size;
  float wobbleRadius = 0.15 * polygon.size;
  Pair currCenter = new Pair(width/2, height/2);

  void init() {
    updateSystem();
  }
  
  void updateSystem() {
    int currIter = frameCount % iters;
    float currAngle = currIter * iterAngle;

    currCenter.x = 200 + (currIter % 8) * 200;
    currCenter.y = 80 + int(currIter / 8) * 200;
    
    polygon.rotation = -currAngle;
    polygon.pos.x = currCenter.x + wobbleRadius * cos(currAngle);
    polygon.pos.y = currCenter.y + wobbleRadius * sin(currAngle);
    //polygon.center.setPos(100,100);
  }

  void drawSystem() {
    //fadeScreen(1,10);
    // background(255);
    
    // noFill();
    // noStroke();
    fill(0);
    polygon.drawSelf(true);
    rect(currCenter.x - polygon.size/4, currCenter.y + 3*polygon.size/8, polygon.size/2, polygon.size + polygon.size/8);
    
    fill(255);
    rect(currCenter.x - squareSide/2, currCenter.y - squareSide/2, squareSide, squareSide);
    
  }
}