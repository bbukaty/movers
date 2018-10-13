import processing.svg.*;

boolean SAVE_OUTPUT = false;
int STEPS_BEFORE_SAVE = 300;
String OUTPUT_PATH = "outputs/candySwirl/";

float[] BACKGROUND = {255,255,255};
int NUM_MOVERS = 3;
Mover[] movers;

void setup() {
  size(1200,1000);
  background(BACKGROUND[0], BACKGROUND[1], BACKGROUND[2]);
  // frameRate(4);
  
  movers = new Mover[NUM_MOVERS];
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(width), random(height));
  }
  if (SAVE_OUTPUT) noLoop();
}

void draw() {
  if (SAVE_OUTPUT) {
    beginRecord(SVG, OUTPUT_PATH + timestamp() + ".svg");
    for (int i = 0; i < STEPS_BEFORE_SAVE; i++) {
      systemStep();
      frameCount++;
    }
    endRecord();
  } else {
    systemStep();
  }
}
