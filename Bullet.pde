class Bullet extends GameObject {

  PVector dir;
  float speed;

  Bullet() {
    super ( eyeX, eyeY, eyeZ, 10);
    speed = 50 ;
    float vx = cos( leftRightHeadAngle);
    float vy = tan ( upDownHeadAngle);
    float vz = sin ( leftRightHeadAngle);
    dir = new PVector ( vx, vy, vz);

    dir.setMag(speed);
  }


  void act() {

  int hitx = int(loc.x + 2000) / gridSize;
int hity = int(loc.z + 2000) / gridSize;

if (hitx >= 0 && hitx < map.width && hity >= 0 && hity < map.height) {
  if (map.get(hitx, hity) == white) {
    loc.add(dir);
  } else {
    lives = 0;
    for (int i = 0; i < 5; i++) {
      objects.add(new Particle(loc));
    }
  }
} else {
  // Out of map bounds – treat it like a hit
  lives = 0;
}

  }
}
