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

  void spawnRandom(int numParticles) {
    for (Pair vertex : getRandomVertices(numParticles)) {
      movers.add(new Mover(vertex));
    }
  }

  void spawnCircle(int numParticles, float radius, float offset) {
    for (Pair vertex : getPolygonVertices(numParticles, radius, offset)) {
      movers.add(new Mover(vertex));
    }
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

  void addRandomAccel(float rangeStart, float rangeEnd) {
    Mover m;
    for (int i = 0; i < movers.size(); i++) {
      m = movers.get(i);
      m.accel.x += random(rangeStart, rangeEnd);
      m.accel.y += random(rangeStart, rangeEnd);
    }
  }

  void chaseNext(float intensity) {
    Mover m;
    Mover t; // target
    for (int i=0; i < movers.size(); i++) {
      m = movers.get(i);
      t = movers.get((i + 1) % movers.size());
      m.accel.x = intensity * (t.pos.x - m.pos.x) / width;
      m.accel.y = intensity * (t.pos.y - m.pos.y) / height;
    }
  }
}
