int w = 50;
int h = 70;
float a = 0;
PImage img;

Paper papers1;
Paper papers2;
Paper papers3;
Paper papers4;
Paper papers5;

void setup() {
  size(550, 600);
  img = loadImage("void.jpg");

  papers1 = new Paper( 50, 500, w, h);
  papers2 = new Paper(150, 500, w, h);
  papers3 = new Paper(250, 500, w, h);
  papers4 = new Paper(350, 500, w, h);
  papers5 = new Paper(450, 500, w, h);
}

void draw() {
  image(img, 0, 0);
  
  papers1.display();
  papers1.over();

  papers2.display();
  papers2.over();

  papers3.display();
  papers3.over();

  papers4.display();
  papers4.over();

  papers5.display();
  papers5.over();
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
