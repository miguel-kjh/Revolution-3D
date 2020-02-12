public class LineOfPoints {
  ArrayList<Point> listOfPoints = new ArrayList();
  
  public void addPoint(Point point){
    listOfPoints.add(point);
  }
  
  public void drawLine(){
    int dimX = 5;
    int dimY = 5;
    if(listOfPoints.size() > 0){
        Point initialPoint = listOfPoints.get(0);
        ellipse(initialPoint.x,initialPoint.y,dimX,dimY);
    }
    for(int index = 0; index < listOfPoints.size() - 1; index++){
        Point firstPoint = listOfPoints.get(index);
        Point secondPoint = listOfPoints.get(index+1);
        ellipse(firstPoint.x,firstPoint.y,dimX,dimY);
        ellipse(secondPoint.x,secondPoint.y,dimX,dimX);
        line(firstPoint.x,firstPoint.y,secondPoint.x,secondPoint.y);
    }
  }
  
  public void removeLine(){
    listOfPoints.clear();
  }
  
  public void removeLastLine(){
    if(listOfPoints.size() > 0){
      listOfPoints.remove(listOfPoints.get(listOfPoints.size() - 1));
    }
  }
  
  public Point getLast(){
    if(listOfPoints.size() == 0) return null;
    return listOfPoints.get(listOfPoints.size()-1);
  }
  
  public ArrayList<Point> getLine(){
    return listOfPoints;
  }
}
