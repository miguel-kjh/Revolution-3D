LineOfPoints lp;

void setup(){
  size(500,500, P3D);
  lp = new LineOfPoints();
}

void draw(){
  background(0);
  paintMiddleLine();
  lp.drawLine();
}

void paintMiddleLine(){
  stroke(255);
  line(width/2,0, width/2, height);
}

void mouseClicked(){
  lp.addPoint(new Point(mouseX,mouseY));
}

void keyPressed(){
  if(key == 'r' || key == 'R'){
    lp.removeLine();
  }
  if(key == 'l' || key == 'L'){
    lp.removeLastLine();
  }
  
}
