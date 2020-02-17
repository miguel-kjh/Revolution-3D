//import gifAnimation.*;


LineOfPoints lp;
boolean drawPosibleLine = false;
boolean defineFigure = false;
boolean userMoveMouse = true; 
CreateFigure figure;
float viewFigureZ = 0;
StarMenu startMenu = new StarMenu();
Menu keyMenu = new KeyMenu();
/*int countFrame = 0;
final int maxFrame = 5;
GifMaker gif;*/

void setup(){
  size(600,600, P3D);
  surface.setTitle("Revolution 3D");
  lp = new LineOfPoints();
  /*gif = new GifMaker(this,"animation.gif");
  gif.setRepeat(0);*/
}

/*void setFrame(){
  if(countFrame == maxFrame){
      gif.addFrame();
      countFrame = 0;
  }
  countFrame++;
}*/

void draw(){
  background(0);
  if(startMenu.hasToBePainted()){
    startMenu.paintMenu();
    if(startMenu.nextMenuKey()){
      keyMenu.allowToPaint();
    } else {
      keyMenu.prohibitPainting();
    }
    //setFrame();
    return;
  }
  if(keyMenu.hasToBePainted()){
    keyMenu.paintMenu();
    //setFrame();
    return;
  }
  if(!defineFigure){
    paintMiddleLine();
    paintBigX();
    if(drawPosibleLine){
      paintPosibleLine();
    }
    lp.drawLine();
  } else {
    moveFigure();
    paintFigure();
  }
  //setFrame();
}

void moveFigure(){
  translate(width/2,height/2,viewFigureZ);
  rotateX(mouseY*PI/(width/4));
  rotateY(mouseX*PI/(height/4));
}

void paintFigure(){
  figure = new CreateFigure();
  figure.starDraw(118,225,2);
  figure.defineVertex(lp.getLine());
  figure.createFigure();
}

void paintMiddleLine(){
  stroke(255);
  line(width/2,0, width/2, height);
}

void paintBigX(){
  stroke(255);
  line(0,0, width/2, height);
  line(0,height, width/2, 0);
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

boolean anyMenuActive(){
  return startMenu.hasToBePainted() || keyMenu.hasToBePainted();
}

void keyPressed(){
  if(!defineFigure && !anyMenuActive() && (key == 'r' || key == 'R')){
    lp.removeLine();
  }
  if(!defineFigure && !anyMenuActive() && (key == 'l' || key == 'L')){
    lp.removeLastLine();
  }
  if(defineFigure && (key == 'w' || key == 'W')){
    viewFigureZ -= 40;
  }
  if(defineFigure && (key == 's' || key == 'S')){
    viewFigureZ += 40;
  }
  if(!defineFigure && !anyMenuActive() && !lp.isEmpty() &&(key == 'c' || key == 'C')){
    defineFigure = true;
  }
  if(startMenu.hasToBePainted() && keyCode == ENTER){
    startMenu.prohibitPainting();
  }
  if(startMenu.hasToBePainted() && keyCode == RIGHT){
    startMenu.chooseKey();
  }
  if(startMenu.hasToBePainted() && keyCode == LEFT){
    startMenu.chooseStart();
  }
  if(key == 'f' || key == 'F'){
    if(keyMenu.hasToBePainted()){
      keyMenu.prohibitPainting();
      startMenu.allowToPaint();
    } else if(defineFigure){
      defineFigure = false;
      lp.removeLine();
      figure = new CreateFigure();
      viewFigureZ = 0;
    } else if(!startMenu.hasToBePainted() && !keyMenu.hasToBePainted()){
      startMenu.allowToPaint();
    }
  }
  /*if(key == 'g' || key == 'G'){
    gif.finish();
  }*/
  
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
