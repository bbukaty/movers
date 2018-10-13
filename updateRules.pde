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
void checkBounces(float speedDissipation) {
  for (Mover m: movers) {
    if (m.pos.x > width) {
      m.vel.x = -m.vel.x * speedDissipation;
      m.pos.x = width;
      m.accel.x = 0;
    } else if (m.pos.x < 0) {
      m.vel.x = -m.vel.x * speedDissipation;
      m.pos.x = 0;
      m.accel.x = 0;
    }
    if (m.pos.y > height) {
      m.vel.y = -m.vel.y * speedDissipation;
      m.pos.y = height;
      m.accel.y = 0;
    } else if (m.pos.y < 0) {
      m.vel.y = -m.vel.y * speedDissipation;
      m.pos.y = 0;
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
