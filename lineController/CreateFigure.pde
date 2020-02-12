
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
      figure.vertex(point.x,point.y,point.z);
      //println(point.x,point.y,point.z);
      for(float angle = 0.0f; angle <= PI*2; angle += PI/4){
        float pointX = point.x*cos(angle) - point.z*sin(angle);
        float pointZ = point.x*sin(angle) + point.z*cos(angle);
        //point.x = pointX;
        //point.z = pointZ;
        figure.vertex(pointX,point.y,pointZ);
        Point nexPoint = listPoint.get(index).getTranslate();
        figure.vertex(pointX,nexPoint.y,pointZ);
        //println(pointX,nexPoint.y,pointZ);
      }
    }
  }
  
  public void createFigure(){
    figure.endShape(CLOSE);
    shape(figure);
  }
  
}
