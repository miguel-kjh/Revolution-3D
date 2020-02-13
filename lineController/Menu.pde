interface Menu{
  void paintMenu();
  void allowToPaint();
  void prohibitPainting();
  boolean hasToBePainted();
}

class StarMenu implements Menu{
  private boolean shoulBePaint = true;
  private String textStart,textKey;
  private boolean controllers;
  
  public StarMenu(){
    textStart = "> Start";
    textKey = " Controls";
    controllers = false;
  }
  
  @Override
  void paintMenu(){
    fill(0, 102, 153);
    textSize(65);
    textAlign(CENTER,CENTER);
    text("Revolution 3D",width/2,height * 0.10);
    textSize(30);
    text(textStart,width * 0.30,height * 0.90);
    text(textKey,width * 0.70,height * 0.90);
    noFill();
    translate(width/2, height/2);
    rotateX(mouseY*PI/(width/2));
    rotateY(-mouseX*PI/(height/2));
    fill(118);
    sphere(100);
  }
  
  @Override
  void allowToPaint(){
    shoulBePaint = true;
  }
  
  @Override
  void prohibitPainting(){
    shoulBePaint = false;
  }
  
  @Override
  boolean hasToBePainted(){
    return shoulBePaint;
  }
  
  boolean nextMenuKey(){
    return controllers;
  }
  
  public void chooseKey(){
    textStart = " Start";
    textKey = "> Controls";
    controllers = true;
  }
  
  public void chooseStart(){
    textStart = "> Start";
    textKey = " Controls";
    controllers = false;
  }
  
}

class KeyMenu implements Menu{
  private boolean shoulBePaint = true;
    
  @Override
  void paintMenu(){
    stroke(255);
    textAlign(CENTER,CENTER);
    textSize(20);
    int dim = 30;
    paintKey(width * 0.20,height * 0.10, 'F',dim);
    text("to return",(width+dim)/2,(height+dim) * 0.10);
    
    paintKey(width * 0.20,height * 0.20, 'C',dim);
    text("to create",(width+dim)/2,(height+dim) * 0.20);
    
    paintKey(width * 0.20,height * 0.30, 'W',dim);
    text("to zoom out",(width+dim)/2,(height+dim) * 0.30);
    
    paintKey(width * 0.20,height * 0.40, 'S',dim);
    text("to bring the figure closer",(width+dim)/2,(height+dim) * 0.40);
    
    text("You can control the zoom of",width * 0.50,height * 0.60);
    text("the figure with the mouse wheel too",width * 0.50,height * 0.70);
    fill(255);
    
  }
  
  void paintKey(float x, float y,char letter, int dim){
    fill(0);
    rect(x,y,dim,dim);
    fill(255);
    text(letter, x+dim/2, y+dim/2);
    noFill();
  }
  
  @Override
  void allowToPaint(){
    shoulBePaint = true;
  }
  
  @Override
  void prohibitPainting(){
    shoulBePaint = false;
  }
  
  @Override
  boolean hasToBePainted(){
    return shoulBePaint;
  }
}