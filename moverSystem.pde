class MoverSystem {
  ArrayList<Mover> movers;

  MoverSystem() {
    movers = new ArrayList<Mover>();
  }

  void init() {}
  void updateSystem() {}
  void drawSystem() {}
  void step() {
    drawSystem();
    updateSystem();
  }

  // perform one step of kinematics updates (velocity, position)
  void kinematicsUpdate(float timePassed) {
    for (Mover m : movers) {
      m.vel = m.vel.plus(m.accel.scale(timePassed));
      m.pos = m.pos.plus(m.vel.scale(timePassed));
      // TODO do the math instead of approximation
    }
  }

  // Checks if any movers went offscreen and bounces them off.
  void checkBounces(float borderPercent, float speedDissipation) {
    float border = max(width, height) * (borderPercent/100) / 2;
    float rightEdge = width - border;
    float downEdge = height - border;
    float upEdge = border;
    float leftEdge = border;
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

}
