int w = 50;
int h = 70;
float a = 0;
PImage img;
  
Oblivion oblivion;
Paper paper1;
Paper paper2;
Paper paper3;
Paper paper4;
Paper paper5;

void setup() {
  size(550, 600);
  
  oblivion = new Oblivion(img);

  paper1 = new Paper( 50, 500, w, h);
  paper2 = new Paper(150, 500, w, h);
  paper3 = new Paper(250, 500, w, h);
  paper4 = new Paper(350, 500, w, h);
  paper5 = new Paper(450, 500, w, h);
}

void draw() {
  oblivion.display();
  
  paper1.display();
  paper1.update();

  paper2.display();
  paper2.update();

  paper3.display();
  paper3.update();

  paper4.display();
  paper4.update();

  paper5.display();
  paper5.update();
  
//  oblivion.voidBorder();  // Moved to oblivion.void display()
  
//  if (paper1.overlaps(paper2)){
//    paper2.returnToOriginalPlace();
//  }


}

