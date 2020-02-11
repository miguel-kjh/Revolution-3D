
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
  
  public void defineVertex(Point point){
    for(float angle = 0.0f; angle <= PI*2; angle += PI/4){
      figure.vertex(
        point.x*cos(angle) - point.z*sin(angle),
        point.y,
        point.x*sin(angle) + point.z*cos(angle));
    }
  }
  
  public void createFigure(){
    figure.endShape(CLOSE);
    shape(figure);
  }
  
}
