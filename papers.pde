class Paper {
  int x, y, w, h;
  int f, s;
  float rw, rh;
  float rotate = 0;
  boolean over;
  boolean locked;

  Paper (int _x, int _y, int _w, int _h) {  // Constructor
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    f = 200;
    s = 160;
  }

  void display() {          // draws the shape
    if (locked) {        // checks to see if the paper has been pressed
      paper(rw, rh, rotate);    // renders the moving paper animation

      if (overVoid(x, y, w, h)) {      
        rotate = rotate + 0.15;     // causes the rectangle() to rotate when overVoid
        if (rw > 0 || rh > 0) {
          rw = rw - 1;             // shrinks the rectangle() width
          rh = rh - 1.4;            // shrinks the rectangle() height
        }
      }
    } else {
      rw = w;
      rh = h;
      paper(rw, rh, 0);
    }
  }

  void paper(float rw, float rh, float rotate) {
    pushMatrix();
      translate(x+rw/2, y+rh/2);
      rotate(rotate);
      stroke(s);
      fill(f);
      rectMode(CENTER);
      rect(0, 0, rw, rh);
    popMatrix();
  }

//  boolean pressed() {
//    if (over && mousePressed) {  // checks to see if the cursor is over the shape && if mousePressed
//      x = mouseX-w/2;            // moves the paper along with the mouse
//      y = mouseY-h/2;            // moves the paper along with the mouse
//      return true;
//    } else {   
//      return false;
//    }
//  }

  boolean overEvent(/*int x, int y, int w, int h*/) { // Checks to see if the mouse is over the shape.
    if (mouseX >= x && mouseX <= x + w && 
        mouseY >= y && mouseY < y +h) {
      return true;
    } else {
      return false;
    }
  }

  boolean overVoid(int x, int y, int w, int h) { // HOW DO I DETERMINE THE EDGES OF A CURVED SHAPE?? MATRIX??
    // stroke(0,0, 200); // ellipse
    // noFill(); // ellipse
    // ellipse(width/2, (width/2)-60, width-140, width-140); // target shape for applying spin() and disappear().

    if (mouseX > 70 && mouseY > 30 && mouseX < 470 && mouseY < 410) {
      return true;
    } else {
      return false;
    }
  }
  
  void update() {
    if (overEvent()) {
      over = true; 
    } else {
      over = false;
    }
    if (mousePressed && over) {
      locked = true; 
    }
    if (!mousePressed) {
      locked = false; 
    }
    if (locked) {
      x = mouseX-w/2;     
      y = mouseY-h/2; 
    }
  }
  
  


  //   void locked() {  // How do I make it so the other papers don't collect when one is selected and moved over another?
  //      
  //   }
}

