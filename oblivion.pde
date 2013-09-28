class Oblivion {
  int x, y, w, h;

  Oblivion (PImage _img) {
    img = _img;
    img = loadImage("void.jpg");
  }

  void display() {
    image(img, 0, 0);
    voidBorder();
  }

  void voidBorder() {
    noFill();
//    noStroke();
    stroke( 0, 0, 200);
    ellipse(width/2, (width/2)-60, width-140, width-140); // target shape for applying spin() and disappear().
  }

  boolean overVoid(int x, int y, int w, int h) { // HOW DO I DETERMINE THE EDGES OF A CURVED SHAPE?? MATRIX??
    // stroke(0,0, 200); // ellipse
    // noFill(); // ellipse
    // ellipse(width/2, (width/2)-60, width-140, width-140); // target shape for applying spin() and disappear().

    if (mouseX > 70 && mouseY > 30 && mouseX < 470 && mouseY < 410) {
      return true;
    } 
    else {
      return false;
    }
  }
}

