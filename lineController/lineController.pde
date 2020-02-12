LineOfPoints lp;
boolean drawPosibleLine = false;
boolean defineFigure = false;
CreateFigure figure;
float viewFigureZ = 0;

void setup(){
  size(600,600, P3D);
  surface.setTitle("Revolution 3D");
  lp = new LineOfPoints();
  figure = new CreateFigure();
}

void draw(){
  background(0);
  if(!defineFigure){
    paintMiddleLine();
    if(drawPosibleLine){
      paintPosibleLine();
    }
    lp.drawLine();
  } else {
    translate(mouseX,mouseY,viewFigureZ);
    paintFigure();
  }
}

void paintFigure(){
  figure.starDraw(118,225,2);
  figure.defineVertex(lp.getLine());
  figure.createFigure();
}

void paintMiddleLine(){
  stroke(255);
  line(width/2,0, width/2, height);
}

void paintPosibleLine(){
  Point point = lp.getLast();
  if(point != null){
    line(point.x,point.y,getMouseX(),mouseY);
  }
}

void mousePressed(){
  if(!defineFigure) drawPosibleLine = true;
}

void mouseReleased(){
  if(!defineFigure){
    drawPosibleLine = false;
    lp.addPoint(new Point(getMouseX(),mouseY));
  }
}

float getMouseX(){
  float mousePosX = mouseX;
  if(mouseX < width/2) mousePosX = width/2;
  return mousePosX;
}

void keyPressed(){
  if(!defineFigure && (key == 'r' || key == 'R')){
    lp.removeLine();
  }
  if(!defineFigure && (key == 'l' || key == 'L')){
    lp.removeLastLine();
  }
  if(defineFigure && (key == 'w' || key == 'W')){
    viewFigureZ -= 40;
  }
  if(defineFigure && (key == 's' || key == 'S')){
    viewFigureZ += 40;
  }
  if(!defineFigure && keyCode == ENTER){
    defineFigure = true;
  }
  if(defineFigure  && (key == 'f' || key == 'F')){
    defineFigure = false;
    lp.removeLine();
    figure = new CreateFigure();
  }
  
}

void mouseWheel(MouseEvent event) {
  if(defineFigure){
    float e = event.getCount();
    if(e < 0){
      viewFigureZ -= 40;
    } else {
      viewFigureZ += 40;
    }
  }
}
