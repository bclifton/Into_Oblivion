class Paper {
  int x, y, w, h;
  int f, s;
  float rw, rh;
  float rotate = 0;
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
      rectangle(rw, rh, rotate);    // renders the moving paper animation
 
      if (overVoid(x, y, w, h)) {      
        rotate = rotate + 0.15;     // causes the rectangle() to rotate when overVoid
        if (rw > 0 || rh > 0) {
          rw = rw - 1;             // shrinks the rectangle() width
          rh = rh - 1.4;            // shrinks the rectangle() height        
        }
      }
    } 
 
    else {
      rw = w;
      rh = h;
      rectangle(rw, rh, 0);

    }
  }
  
  void rectangle(float rw, float rh, float rotate) {
    pushMatrix();
      translate(x+rw/2, y+rh/2);
      rotate(rotate);
      stroke(s);
      fill(f);
      rectMode(CENTER);
      rect(0, 0, rw, rh);
    popMatrix();    
  }

  void cursorOverShape() {
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
