import java.awt.Robot;


Robot rbt;
boolean skipFrame;

boolean wkey, akey, skey, dkey,spacekey;
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


//gameobjects 

ArrayList<GameObject> objects; 





void setup () {


  fullScreen(P3D);
  textureMode (NORMAL);
  objects = new ArrayList<GameObject>();
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
  gridSize = 100;
  noCursor();

  try {

    rbt=new Robot();
  }
  catch(Exception e) {
    e.printStackTrace();
  }


  //initialize map
  map = loadImage("map.png");
  
}


void draw () {
  background (0);
  pointLight( 255, 255, 255, eyeX, eyeY, eyeZ);
  camera( eyeX, eyeY, eyeZ, focusX, focusY, focusZ, tiltX, tiltY, tiltZ);
  drawFloor(-2000, 2000, height, gridSize);
  drawFloor (-2000, 2000, height -gridSize*4, gridSize);
  drawFocalPoint();
  controlCamera();
  drawMap();
  
  int i = 0 ; 
  while ( i< objects.size()){
    GameObject obj = objects.get(i); 
    obj.act(); 
    obj.show(); 
    if ( obj.lives==0){
      obj.act(); 
      obj.show();
      
    }else {
     i++;
    }
    
    
    if(spacekey){
      objects.add( new Bullet());
      
      
    }
    
    
    
  }
}
