// Functions that change the pos/vel/accel vectors of the movers,
// and a few movement helper functions.

// perform one step of kinematics updates (position, velocity)
void kinematicsUpdate() {
  for (Mover m : movers) {
    m.vel.x += m.accel.x;
    m.vel.y += m.accel.y;

    m.pos.x += m.vel.x;
    m.pos.y += m.vel.y;

    crazyRing(m.pos, 0.8*m.radius + 5*abs(m.vel.x + m.vel.y));
    m.addPoint(m.pos.x, m.pos.y);
    m.drawSelf();
  }
}

// Checks if any movers went offscreen and bounces them off.
void checkBounces(float speedDissipation) {
  for (Mover m: movers) {
    if (m.pos.x > width) {
      m.vel.x = -m.vel.x * speedDissipation;
      m.pos.x = width;
    } else if (m.pos.x < 0) {
      m.vel.x = -m.vel.x * speedDissipation;
      m.pos.x = 0;
    }
    if (m.pos.y > height) {
      m.vel.y = -m.vel.y * speedDissipation;
      m.pos.y = height;
    } else if (m.pos.y < 0) {
      m.vel.y = -m.vel.y * speedDissipation;
      m.pos.y = 0;
    }
  }
}

void addRandomAccel(float aScale) {
  Mover m;
  for (int i = 0; i < movers.length; i++) {
    m = movers[i];
    m.accel.scale(0.8); // keep things in check by slowing them down
    m.accel.x += random(-aScale, aScale);
    m.accel.y += random(-aScale, aScale);
  }
}

float A_SCALE = 0.1;
void chaseNext() {
  Mover m;
  Mover t; // target
  for (int i=0; i < movers.length; i++) {
    m = movers[i];
    t = movers[(i + 1) % movers.length];
    m.accel.x = A_SCALE * (t.pos.x - m.pos.x) / width;
    m.accel.y = A_SCALE* (t.pos.y - m.pos.y) / height;
  }
}