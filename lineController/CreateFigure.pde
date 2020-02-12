
public class CreateFigure {
  PShape figure;
  public CreateFigure(){
    figure = createShape();
  }
  
  public void starDraw(int fillColor, int strokeColor, float density){
    figure.beginShape(TRIANGLE_STRIP);
    figure.fill(fillColor);
    figure.stroke(strokeColor);
    figure.strokeWeight(density);
  }
  
  public void defineVertex(ArrayList<Point> listPoint){
    for(int index = 1; index < listPoint.size(); index++){
      Point point = listPoint.get(index-1).getTranslate(); 
      Point nextPoint = listPoint.get(index).getTranslate();
      figure.vertex(point.x,point.y,point.z);
      for(float angle = 0.0f; angle <= PI*2; angle += PI/4){
        float pointX = point.x*cos(angle) - point.z*sin(angle);
        float pointZ = point.x*sin(angle) + point.z*cos(angle);
        figure.vertex(pointX,point.y,pointZ);
        
        float nextPointX = nextPoint.x*cos(angle) - nextPoint.z*sin(angle);
        float nextPointZ = nextPoint.x*sin(angle) + nextPoint.z*cos(angle);
        figure.vertex(nextPointX,nextPoint.y,nextPointZ);
      }
    }
  }
  
  public void createFigure(){
    figure.endShape();
    shape(figure);
  }
  
}
