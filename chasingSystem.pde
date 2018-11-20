// class ChasingSystem extends MoverSystem {
//   boolean curved = false;

//   // TODO: constructor with spawn

//   void chaseNext(float intensity) {
//     Mover m;
//     Mover t; // target
//     for (int i=0; i < movers.length; i++) {
//       m = movers[i];
//       t = movers[(i + 1) % movers.length];
//       m.accel.x = intensity * (t.pos.x - m.pos.x) / width;
//       m.accel.y = intensity * (t.pos.y - m.pos.y) / height;
//     }
//   }

//   void step(int granularity) {
//     // SYSTEM UPDATE STEP
//     if (frameCount % granularity == 0) {
//       chaseNext(0.3);
//       // scaleVels(0.99);
//     }
//     // GRANULAR PHYSICS STEP 
//     checkBounces(0.6);
//     kinematicsUpdate(1.0/granularity);
//   }

//   void draw() {
//     // fadeScreen(3, 3);
//     // fadeScreen(50, 40);
//     noStroke();
//     float r = triangleWave(0, 255, 150*granularity/2, 70);
//     float g = triangleWave(0, 255, 180*granularity/2, 0);
//     fill(r, g, 200, 25);
//     if (curved) drawCurve();
//     else drawPolygon();
//   }

//   void drawPolygon() {
//     beginShape();
//     Mover m;
//     for (int i=0; i < movers.length + 1; i++) {
//       m = movers[(i + 1) % movers.length];
//       vertex(m.pos.x, m.pos.y);
//     }
//     endShape();
//   }

//   void drawCurve() {
//     beginShape();
//     Mover m;
//     for (int i=0; i < movers.length + 3; i++) {
//       // +3 loops around to the beginning to close curve
//       m = movers[(i + 1) % movers.length];
//       curveVertex(m.pos.x, m.pos.y);
//     }  
//     endShape();
//   }
// }