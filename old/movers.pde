import processing.svg.*;

boolean SAVE_OUTPUT = false;
String OUTPUT_TYPE = "tif";
int RASTER_SCALE = 8;
int STEPS_BEFORE_SAVE = 40;
String OUTPUT_PATH = "outputs/";

MoverSystem system;

void setup() {
  size(1000,1000);
  // frameRate(10);
  // randomSeed(6);
  if (SAVE_OUTPUT) noLoop();
  
  // system = new SimpleParticleSystem();
  // system = new ShiftingPolygon();
  system = new TenuousConnections();
  // system = new Zoetrope();

  system.init();
}

void runSystem() {
  for (int i = 0; i < STEPS_BEFORE_SAVE; i++) {
    system.step();
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
    system.step();
  }
}

void mousePressed() {
  // mark down some frame numbers that you might want to record up to
  println(frameCount);
}
