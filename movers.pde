import processing.svg.*;

boolean SAVE_OUTPUT = false;
String OUTPUT_TYPE = "tif";
int RASTER_SCALE = 6;
int STEPS_BEFORE_SAVE = 500;
String OUTPUT_PATH = "outputs/";

Mover[] movers;

void setup() {
  size(1000,1000);
  //fullScreen();
  // frameRate(4);
  // randomSeed(6);
  background(255);
  if (SAVE_OUTPUT) noLoop();

  int numMovers = 12;
  movers = new Mover[numMovers];
  spawnCircle(numMovers, 0);
}

void runSystem() {
  background(255);
  for (int i = 0; i < STEPS_BEFORE_SAVE; i++) {
    systemStep();
    frameCount++;
  }
}

void draw() {
  if (SAVE_OUTPUT) {
    if (OUTPUT_TYPE == "svg") {
      beginRecord(SVG, OUTPUT_PATH + timestamp() + ".svg");
      runSystem();
      endRecord();
    } else if (OUTPUT_TYPE == "tif" || OUTPUT_TYPE == "png") {
      PGraphics hires = createGraphics(width * RASTER_SCALE, height * RASTER_SCALE);
      beginRecord(hires);
      hires.scale(RASTER_SCALE);
      runSystem();
      endRecord();
      hires.save(OUTPUT_PATH + timestamp() + "." + OUTPUT_TYPE);
      // hires.save(OUTPUT_PATH + STEPS_BEFORE_SAVE + "." + OUTPUT_TYPE);
    }
    exit();
  } else {
    systemStep();
  }
}

void keyPressed() {
  if (key == ESC) {
    exit();
  }
}

void mousePressed() {
  // mark down some frame numbers that you might want to record up to
  println(frameCount);
}
