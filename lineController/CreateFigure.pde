
public class CreateFigure {
  PShape figure;
  private final float angle = PI/4;
  public CreateFigure(){
    figure = createShape();
    figure.beginShape(TRIANGLE_STRIP);
  }
  
  public void starDraw(int fillColor, int strokeColor, float density){
    figure.fill(fillColor);
    figure.stroke(strokeColor);
    figure.strokeWeight(density);
  }
  
  public void defineVertex(ArrayList<Point> listPoint){
    for(int index = 1; index < listPoint.size(); index++){
      Point point = listPoint.get(index-1).getTranslate(); 
      Point nextPoint = listPoint.get(index).getTranslate();
      for(float angleIndex = 0.0f; angleIndex <= PI*2; angleIndex += angle){
        float pointX = point.x*cos(angle) - point.z*sin(angle);
        float pointZ = point.x*sin(angle) + point.z*cos(angle);
        figure.vertex(pointX,point.y,pointZ);
        
        float nextPointX = nextPoint.x*cos(angle) - nextPoint.z*sin(angle);
        float nextPointZ = nextPoint.x*sin(angle) + nextPoint.z*cos(angle);
        figure.vertex(nextPointX,nextPoint.y,nextPointZ);
        point.x = pointX;
        point.z = pointZ;
        
        nextPoint.x = nextPointX;
        nextPoint.z = nextPointZ;
        
      }
    }
    figure.endShape();
  }
  
  public void createFigure(){
    shape(figure);
  }
  
}
