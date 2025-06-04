void texturedCube(float x , float y , float z , PImage texture, float size){


  pushMatrix ();

  noStroke();
  translate (width/2, height/2, 0 );
  scale (100);

  //box (1);





  //shape 2
  pushMatrix();
   scale (100);

  beginShape(QUADS);
  texture(texture);
  //top
  //x , y , z , tx , ty
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 0, 1, 1, 1 );
  vertex(0, 0, 1, 0, 1);


  //bottom
  vertex(0, 1, 0, 0, 0);
  vertex(1, 1, 0, 1, 0);
  vertex(1, 1, 1, 1, 1 );
  vertex(0, 1, 1, 0, 1);

  //left
  vertex(0, 0, 0, 0, 0);
  vertex(0, 0, 1, 1, 0);
  vertex(0, 1, 1, 1, 1 );
  vertex(0, 1, 0, 0, 1);

  //right

  vertex(1, 0, 0, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1 );
  vertex(1, 1, 0, 0, 1);

  //front
  vertex(0, 0, 1, 0, 0);
  vertex(1, 0, 1, 1, 0);
  vertex(1, 1, 1, 1, 1 );
  vertex(0, 1, 1, 0, 1);
  //back
  vertex(0, 0, 0, 0, 0);
  vertex(1, 0, 0, 1, 0);
  vertex(1, 1, 0, 1, 1 );
  vertex(0, 1, 0, 0, 1);


  endShape();
  popMatrix();
  
}
