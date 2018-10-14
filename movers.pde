import processing.svg.*;

boolean SAVE_OUTPUT = false;
int STEPS_BEFORE_SAVE = 2350;
String OUTPUT_PATH = "outputs/candySwirl/";

float[] BACKGROUND = {255,255,255};
int NUM_MOVERS = 12;
Mover[] movers;

void setup() {
  size(1000,1000);
  background(BACKGROUND[0], BACKGROUND[1], BACKGROUND[2]);
  // frameRate(4);
  
  movers = new Mover[NUM_MOVERS];
  spawnCircle();
  // if (SAVE_OUTPUT) noLoop();
}

void draw() {
  if (SAVE_OUTPUT) {
    background(BACKGROUND[0], BACKGROUND[1], BACKGROUND[2]);
    beginRecord(SVG, OUTPUT_PATH + timestamp() + ".svg");
    for (int i = 0; i < STEPS_BEFORE_SAVE; i++) {
      systemStep();
      frameCount++;
    }
    endRecord();
    // exit();
  } else {
    systemStep();
  }
}
