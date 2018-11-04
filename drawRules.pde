// Functions that draw things on the screen based on the positions of all the movers,
// and a few drawing helper functions.

void fadeScreen(int interval, float alpha) {
  if (frameCount % interval == 0) {
    noStroke();
    fill(255, alpha);
    rect(0, 0, width, height);
  }
}

float triangleWave(int low, int high, int period, int offset) {
  float amp = float(high - low);
  float slope = 2 * amp / period;
  int t = frameCount % period + offset;
  if (t < period / 2) {
    return slope * t;
  } else {
    return 2.0 * amp - slope * t;
  }
}

float rangeSin(int low, int high, int period, int offset) {
  return 0; // TODO
}
