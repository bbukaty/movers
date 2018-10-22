// Functions that change the pos/vel/accel vectors of the movers,
// and a few movement helper functions.

// perform one step of kinematics updates (position, velocity)
void kinematicsUpdate(float factor) {
  for (Mover m : movers) {
    m.vel = m.vel.add(m.accel.scale(factor));
    m.pos = m.pos.add(m.vel.scale(factor));
  }
}

// Checks if any movers went offscreen and bounces them off.
void checkBounces(float speedDissipation, float border) {
  float rightEdge = border*width;
  float downEdge = border*height;
  float upEdge = (1-border)*width;
  float leftEdge = (1-border)*height;
  for (Mover m: movers) {
    if (m.pos.x > rightEdge) {
      m.pos.x = rightEdge;
      m.vel.x = -m.vel.x * speedDissipation;
      m.accel.x = 0;
    } else if (m.pos.x < leftEdge) {
      m.pos.x = leftEdge;
      m.vel.x = -m.vel.x * speedDissipation;
      m.accel.x = 0;
    }
    if (m.pos.y > downEdge) {
      m.pos.y = downEdge;
      m.vel.y = -m.vel.y * speedDissipation;
      m.accel.y = 0;
    } else if (m.pos.y < upEdge) {
      m.pos.y = upEdge;
      m.vel.y = -m.vel.y * speedDissipation;
      m.accel.y = 0;
    }
  }
}

void addRandomAccel(float aScale) {
  Mover m;
  for (int i = 0; i < movers.length; i++) {
    m = movers[i];
    m.accel.x += random(-aScale, aScale);
    m.accel.y += random(-aScale, aScale);
  }
}

void chaseNext(float factor) {
  Mover m;
  Mover t; // target
  for (int i=0; i < movers.length; i++) {
    m = movers[i];
    t = movers[(i + 1) % movers.length];
    m.accel.x = factor * (t.pos.x - m.pos.x) / width;
    m.accel.y = factor * (t.pos.y - m.pos.y) / height;
  }
}

void scaleVels(float factor) {
  for (Mover m: movers) {
    m.vel = m.vel.scale(factor);
  }
}

void scaleAccels(float factor) {
  for (Mover m: movers) {
    m.accel = m.accel.scale(factor);
  }
}
