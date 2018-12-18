boolean RECORDING = false;
System system;

void setup() {
  size(1920, 1080);
  system = new System();
  if (RECORDING) {recorderSetup();}
}

void draw() {
  if (RECORDING) {
    noLoop(); // just run draw() once
    recordSystem();
  } else {
    system.step();
  }
}

void mousePressed() {
  exit();
}

class System {
  ArrayList<Spinner> spinners;
  // int movementCycle = 200;
  // int rotationCycle = 500;
  int movementCycle = 113*16; //primes
  int rotationCycle = 267*16;

  int numSpinners = 1000;
  float startRadius = 0;

  System() {
    spinners = new ArrayList<Spinner>();

    spawnCircle(numSpinners, startRadius, 0, 0.4);
    addSpiralOffset(4);

    background(255);
  }

  void step() {
    draw();
    update();
  }

  void draw() {
    // background(255);
    fadeScreen(1,1);
    noStroke();

    float rectLength = triangleWave(40, 800, float(frameCount % 400)/400);
    // float rectLength = 1000;

    for (int i = 0; i < spinners.size(); i++) {
      float c = triangleWave(0, 255, float(i % 100)/100);
      fill(130, c, 200);
      // fill(0);
      spinners.get(i).draw(rectLength);
    }
  }

  void update() {
    for (Spinner s : spinners) {
      s.theta -= 2*PI / movementCycle;
      s.rotation += 2*PI / rotationCycle;
    }
  }

  void spawnCircle(int numSpinners, float radius, float startAngle, float sectorAngle) {
    for (int i = 0; i < numSpinners; i++) {
      float currAngle = startAngle + i * sectorAngle;
      spinners.add(new Spinner(radius, currAngle, currAngle));
    }
  }

  void addSpiralOffset(float step) {
    for(int i = 0; i < spinners.size(); i++) {
      spinners.get(i).radius += i * step;
    }
  }
}

class Spinner {
  float radius;
  float rotation;
  float theta;

  Spinner(float startRadius, float startRot, float startTheta) {
    radius = startRadius;
    rotation = startRot;
    theta = startTheta;
  }

  Pair getPos() {
    return new Pair(width/2 + radius * cos(theta), height/2 + radius * sin(theta));
  }

  void draw(float rectLength) {
    Pair pos = getPos();
    translate(pos.x, pos.y);
    // rect(-10, -10, cos(rotation)*100, sin(rotation)*100);
    rotate(rotation);
    rect(-10, -10, rectLength, 8, 3); //sin(rotation)*100);
    rotate(-rotation);
    translate(-pos.x, -pos.y);

    // fill(255);
    // ellipse(pos.x,pos.y,10,10);
  }
}
