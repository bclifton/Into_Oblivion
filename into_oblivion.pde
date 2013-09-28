int w = 50;
int h = 70;
float a = 0;
PImage img;

Paper paper1;
Paper paper2;
Paper paper3;
Paper paper4;
Paper paper5;

void setup() {
  size(550, 600);
  img = loadImage("void.jpg");

  paper1 = new Paper( 50, 500, w, h);
  paper2 = new Paper(150, 500, w, h);
  paper3 = new Paper(250, 500, w, h);
  paper4 = new Paper(350, 500, w, h);
  paper5 = new Paper(450, 500, w, h);
}

void draw() {
  image(img, 0, 0);
  
  paper1.display();
  paper1.over();

  paper2.display();
  paper2.over();

  paper3.display();
  paper3.over();

  paper4.display();
  paper4.over();

  paper5.display();
  paper5.over();
  
  if (paper1.overlaps(paper2)){
    paper2.returnToOriginalPlace();
  }
}

//void mouseReleased() {
//     papers1.spin();   
//}



boolean overShape(int x, int y, int w, int h) {        // Checks to see if the mouse is over the shape.
  if (mouseX >= x && mouseX <= x + w && mouseY >= y && mouseY < y +h) {
    return true;
  } else {
    return false;
  }
}

boolean overVoid(int x, int y, int w, int h) {    // HOW DO I DETERMINE THE EDGES OF A CURVED SHAPE?? MATRIX??
//    stroke(0,0, 200);     // ellipse
//    noFill();             // ellipse
//    ellipse(width/2, (width/2)-60, width-140, width-140);    // target shape for applying spin() and disappear().

  if (mouseX > 70 && mouseY > 30 && mouseX < 470 && mouseY < 410) {
    return true;
  } else {
    return false;
  }
}
