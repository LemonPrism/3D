import java.awt.Robot;


Robot rbt;
boolean skipFrame;

boolean wkey, akey, skey, dkey;
float eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ;
float leftRightHeadAngle, upDownHeadAngle;

color black = #000000;//stone bricks
color white = #FFFFFF;//empty
color lblue = #99D9EA;//dirt

//map varibales
int gridSize;
PImage map;
PImage stone;
PImage dirt;



void setup () {


  fullScreen(P3D);
  textureMode (NORMAL);
  stone = loadImage("Stone_Bricks.png");
  dirt = loadImage ("Dirt.png");
  wkey=akey=skey=dkey =false;
  eyeX = width/2;
  eyeY = 9*height/10;
  eyeZ = 0 ;
  focusX= width/2;
  focusY = height/2;
  focusZ =10;
  tiltX =0;
  tiltY =1;
  tiltZ= 0;
  leftRightHeadAngle = radians(270);
  noCursor();

  try {

    rbt=new Robot();
  }
  catch(Exception e) {
    e.printStackTrace();
  }


  //initialize map
  map = loadImage("map.png");
  gridSize = 100;
}


void draw () {
  background (0);
  camera( eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ);
  drawFloor(-2000, 2000, height , gridSize);
  drawFloor ( -2000 , 2000, height -gridSize*3 , gridSize); 
  drawFocalPoint();
  controlCamera();
  drawMap();
}

void drawFocalPoint() {
  pushMatrix();
  translate ( focusX, focusY, focusZ);
  sphere(5);





  popMatrix();
}

void drawMap () {
  for (int x = 0; x < map.width; x++) {
    for (int y = 0; y < map.height; y++) {
      color c = map.get(x, y);
      if ( c == black) {

        texturedCube( x*gridSize-2000, height-gridSize, y*gridSize-2000, stone, gridSize);
        texturedCube( x*gridSize-2000, height-gridSize*2, y*gridSize-2000, stone, gridSize);
        texturedCube( x*gridSize-2000, height-gridSize*3, y*gridSize-2000, stone, gridSize);
      }
      if ( c ==lblue){
        texturedCube( x*gridSize-2000, height-gridSize, y*gridSize-2000, dirt, gridSize);
        texturedCube( x*gridSize-2000, height-gridSize*2, y*gridSize-2000, dirt, gridSize);
        texturedCube( x*gridSize-2000, height-gridSize*3, y*gridSize-2000,dirt, gridSize);
        
        
      }
    }
  }
}


void drawFloor(int start, int end , int level ,int gap) {
  background(0);
  stroke ( 255);
  strokeWeight ( 1) ; 
  int x = start; 
  int z = start;

  while(x<end) {

   texturedCube ( x , level , z , dirt , gap); 
    x=x+gap; 
    if ( x>=end){
      x=start; 
    z = z+ gap;
    }
  }
}


void controlCamera() {

  if (wkey) {
    eyeX = eyeX + cos(leftRightHeadAngle)*10;
    eyeZ= eyeZ  + sin(leftRightHeadAngle)*10;
  }
  if ( skey) {

    eyeX = eyeX - cos(leftRightHeadAngle)*10;
    eyeZ= eyeZ  - sin(leftRightHeadAngle)*10;
  }


  if ( akey) {

    eyeX = eyeX - cos(leftRightHeadAngle+PI/2)*10;
    eyeZ= eyeZ  - sin(leftRightHeadAngle+PI/2)*10;
  }
  if ( dkey) {


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

  println ( eyeX, eyeY, eyeZ);
}




void keyPressed() {
  if ( key=='W'|| key == 'w') wkey = true;
  if ( key=='A'|| key == 'a') akey = true;
  if ( key=='S'|| key == 's') skey = true;
  if ( key=='D'|| key == 'd') dkey = true;
}



void keyReleased() {
  if ( key=='W'|| key == 'w') wkey = false;
  if ( key=='A'|| key == 'a') akey = false;
  if ( key=='S'|| key == 's') skey = false;
  if ( key=='D'|| key == 'd') dkey = false;
}
