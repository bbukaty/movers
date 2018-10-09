import processing.svg.*;

boolean SAVE_OUTPUT = false;
int STEPS_BEFORE_SAVE = 80;
String OUTPUT_PATH = "outputs/";

int NUM_MOVERS = 3;

Mover[] movers;
Pair mouse;
int frames = 0;

String timestamp() {
  return str(month()) + "-"  +
  str(day()) + "_" +
  str(hour()) + "-" +
  str(minute()) + "-" +
  str(second()) + "-" + 
  str(millis());
}

void setup() {
  size(1000, 900);
  background(255);
  
  movers = new Mover[NUM_MOVERS];
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(width), random(height));
  }
  if (SAVE_OUTPUT) noLoop();
}

void systemStep() {
  // draw
  fadeScreen(10);
  // update
  checkBounces(0.8);
  addRandomAccel(0.1);
  kinematicsUpdate();
}

void draw() {
  if (SAVE_OUTPUT) {
    beginRecord(SVG, OUTPUT_PATH + timestamp() + ".svg");
    background(255);
    for (int i = 0; i < STEPS_BEFORE_SAVE; i++) {
      systemStep();
    }
    endRecord();
  } else {
    systemStep();
  }
}
