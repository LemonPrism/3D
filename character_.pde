void drawFocalPoint() {
  pushMatrix();
  translate ( focusX, focusY, focusZ);
  sphere(5);





  popMatrix();
}


void controlCamera() {

  if (wkey&& canMoveForward()) {
    eyeX = eyeX + cos(leftRightHeadAngle)*10;
    eyeZ= eyeZ  + sin(leftRightHeadAngle)*10;
  }
  if ( skey&&canMoveBackwards()) {

    eyeX = eyeX - cos(leftRightHeadAngle)*10;
    eyeZ= eyeZ  - sin(leftRightHeadAngle)*10;
  }


  if ( akey&&canMoveRight()) {

    eyeX = eyeX - cos(leftRightHeadAngle+PI/2)*10;
    eyeZ= eyeZ  - sin(leftRightHeadAngle+PI/2)*10;
  }
  if ( dkey&&canMoveLeft()) {


    eyeX = eyeX - cos(leftRightHeadAngle-PI/2)*10;
    eyeZ= eyeZ  - sin(leftRightHeadAngle-PI/2)*10;
  }

  if ( skipFrame== false) {

    leftRightHeadAngle = leftRightHeadAngle+ (mouseX -pmouseX)*0.01;
    upDownHeadAngle = upDownHeadAngle + ( mouseY -pmouseY)*0.01;
  }
  if (upDownHeadAngle>PI/2.5) upDownHeadAngle =PI/2.5;

  focusX = eyeX+cos(leftRightHeadAngle)*300;
  focusZ = eyeZ+sin(leftRightHeadAngle)*300;


  focusY = eyeY+tan(upDownHeadAngle)*300;


  if ( mouseX<2) {
    rbt.mouseMove(width-3, mouseY);
    skipFrame = true;
  } else if ( mouseX > width-2 ) {
    rbt.mouseMove(3, mouseY);
    skipFrame = true;
  } else {
    skipFrame = false;
  }

  //println ( eyeX, eyeY, eyeZ);
}

boolean canMoveForward() {
  float fwdx, fwdy, fwdz;
  int mapx, mapy;



  fwdx = eyeX+cos(leftRightHeadAngle)*200;
  fwdz= eyeZ+sin(leftRightHeadAngle)*200;
  fwdy = eyeY;


  mapx=int(fwdx+2000)/gridSize;
  mapy = int(fwdz+2000)/gridSize;


  if (map.get(mapx, mapy)== white) {

    return true;
  } else {
    return false;
  }
}

boolean canMoveLeft() {
  float leftx, lefty, leftz;
  int mapx, mapy;
  leftx = eyeX+cos(leftRightHeadAngle+90)*200;
  leftz= eyeZ+sin(leftRightHeadAngle+90)*200;
  leftx = eyeX+cos(leftRightHeadAngle+radians(45))*200;
  leftz= eyeZ+sin(leftRightHeadAngle+radians(45))*200;
  lefty = eyeY;


  mapx=int(leftx+2000)/gridSize;
  mapy = int(leftz+2000)/gridSize;


  if (map.get(mapx, mapy)== white) {

    return true;
  } else {
    return false;
  }
}


boolean canMoveRight() {
  float rightx, righty, rightz;
  int mapx, mapy;
  rightx = eyeX+cos(leftRightHeadAngle+270)*200;
  rightz= eyeZ+sin(leftRightHeadAngle+270)*200;
  righty = eyeY;


  mapx=int(rightx+2000)/gridSize;
  mapy = int(rightz+2000)/gridSize;


  if (map.get(mapx, mapy)== white) {

    return true;
  } else {
    return false;
  }
}

boolean canMoveBackwards() {
  float backx, backy, backz;
  int mapx, mapy;



  backx = eyeX+cos(leftRightHeadAngle+180)*200;
  backz= eyeZ+sin(leftRightHeadAngle+180)*200;
  backy = eyeY;


  mapx=int(backx+2000)/gridSize;
  mapy = int(backz+2000)/gridSize;


  if (map.get(mapx, mapy)== white) {

    return true;
  } else {
    return false;
  }
}
