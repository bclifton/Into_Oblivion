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

class Paper {
  int x, y, w, h;
  int f, s;
  float rotate = 0;
  float shrink = 0;
  boolean over;
  boolean locked = false;

  Paper (int _x, int _y, int _w, int _h) {  // Constructor
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    f = 200;
    s = 160;
  }

  void display() {          // draws the shape
    if (pressed()) {        // checks to see if the paper has been pressed
//      rectangle(rotate, shrink);    // [TEST] for adding the scale(shrink) attribute
      rectangle(rotate);    // renders the moving paper animation
 
      if (overVoid(x, y, w, h)) {      
        rotate = rotate + 0.15;     // causes the rectangle() to rotate when overVoid
//        shrink = shrink + 0.1;     // causes the rectangle() to shrink from view [BROKEN]
      }
    } 
    
    else {
//      rectangle(0, 0);    // [TEST] for adding the scale(shrink) attribute
      rectangle(0);

    }
  }
  
//  void rectangle(float rotate, float shrink) {    // [TEST] for adding the scale(shrink) attribute
  void rectangle(float rotate) {
    pushMatrix();
      translate(x+w/2, y+h/2);
      rotate(rotate);
//      scale(shrink);    // [TEST] for adding the scale(shrink) attribute
      stroke(s);
      fill(f);
      rectMode(CENTER);
      rect(0, 0, w, h);
    popMatrix();    
  }

  void over() {
    if (overShape(x, y, w, h)) {    // references the overPaper function which determines if the cursor is over the shape.
      over = true;
    } else {
      over = false;  
    }
  }

  boolean pressed() {
    if (over && mousePressed) {  // checks to see if the cursor is over the shape && if mousePressed
      x = mouseX-w/2;            // moves the paper along with the mouse
      y = mouseY-h/2;            // moves the paper along with the mouse
      return true;
    } else {   
      return false;
    }
  }
  
//  void spin() {   
//     rotate = rotate + 0.15; 
//     pushMatrix();
//       rotate(rotate);
//     popMatrix();
//   }
   
//   void disappear() {
//     shrink = shrink - 0.1;
//     pushMatrix();
//       scale(shrink);
//     popMatrix();  
//   }
   
//   void locked() {  // How do I make it so the other papers don't collect when one is selected and moved over another?
//      
//   }

}

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
