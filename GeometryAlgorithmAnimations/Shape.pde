float SlopeFromAngle(float angle) {
  if (angle < 0)
    angle = 360 - angle;
  angle %= 360;
  return tan(radians(angle));
}

interface Shape {
  public void Render();
}

public class AnimationShape{
 public Shape shape;
 //Whether the shape will continue to render after its initial appearance
 //Useful for giftwrapping, where you show the line rotating into position 
 public boolean persistent;
}

class Point implements Shape {
  public int x, y;

  public Point() {
    this(0, 0);
  }

  public Point(int x, int y) {
    this.x = x;
    this.y = y;
  }

  public void Render() {
    ellipseMode(RADIUS);
    fill(0);
    noStroke();
    ellipse(x, y, 2, 2);
  }
}

class LineSegment implements Shape {
  public int x1, y1, x2, y2;

  public LineSegment() {
    this(0, 0, 0, 0);
  }

  public LineSegment(int x1, int y1, int x2, int y2) {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
  }

  public LineSegment(Point p1, Point p2) {
    this.x1 = p1.x;
    this.y1 = p1.y;
    this.x2 = p2.x;
    this.y2 = p2.y;
  }

  public void Render() {
    stroke(0);
    strokeWeight(1);
    line(x1, y1, x2, y2);
  }
}

//If you have an angle, run it through SlopeFromAngle() first.
//Remember, slopes may look strange because in Processing y=0 at the top of the screen
//i.e. Your slopes will be upside down from traditional geometric representation
class Line implements Shape {
  int x, y;
  float slope;

  public Line() {
    this(0, 0, 0);
  }

  public Line(int x, int y, float slope) {
    this.x = x;
    this.y = y;
    this.slope = slope;
  }

  public void Render() {
    stroke(0);
    strokeWeight(1);
    line(x, y, width / slope, height * slope);
  }
}