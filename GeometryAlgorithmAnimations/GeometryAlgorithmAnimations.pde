enum Algorithm { 
  Diagonal, EarBased, GiftWrapping
}
final Algorithm algorithm = Algorithm.EarBased;

int MidX, MidY;

Button start, stop, reset;
Line horizontalAxis, verticalAxis;

GeometryAnimation diagonal;
GeometryAnimation ear;
GeometryAnimation wrap;

Point[] polygon = new Point[7];

void setup() {
  size(800, 800);
  MidX = width / 2;
  MidY = height / 2;

  frameRate(10);

  start = new Button(5, 5, 120, 35, "Start");
  stop = new Button(5, 45, 120, 35, "Stop");
  reset = new Button(5, 85, 120, 35, "Reset");
  horizontalAxis = new Line(0, MidY, 0);
  verticalAxis = new Line(MidX, 0, 90);

  polygon[0] = new Point(XtoP(3), YtoP(-2)); 
  polygon[1] = new Point(XtoP(3), YtoP(2)); 
  polygon[2] = new Point(XtoP(1), YtoP(3));
  polygon[3] = new Point(XtoP(-1), YtoP(0)); 
  polygon[4] = new Point(XtoP(-3), YtoP(3));
  polygon[5] = new Point(XtoP(-3), YtoP(-2));
  polygon[6] = new Point(XtoP(-1), YtoP(-1));

  //Define base displays
  diagonal = new GeometryAnimation();
  for (int i = 0; i < polygon.length - 1; ++i) {
    diagonal.base.add(new LineSegment(polygon[i], polygon[i + 1]));
  }
  diagonal.base.add(new LineSegment(polygon[polygon.length - 1], polygon[0]));

  ear = new GeometryAnimation();
  ear.base = diagonal.base;

  wrap = new GeometryAnimation();
  for (int i = 0; i < polygon.length; ++i) {
    wrap.base.add(polygon[i]);
  }

  //And now the fun part: the animation frames
  //diagonal
  diagonal.anim.add(new AnimationShape(new LineSegment(polygon[0], polygon[2]), true));
  diagonal.anim.add(new AnimationShape(new LineSegment(polygon[0], polygon[3]), true));
  diagonal.anim.add(new AnimationShape(new LineSegment(polygon[3], polygon[5]), true));
  diagonal.anim.add(new AnimationShape(new LineSegment(polygon[3], polygon[6]), true));

  //ear-based
  ear.anim.add(new AnimationShape(new LineSegment(polygon[0], polygon[2]), true));
  ear.anim.add(new AnimationShape(new LineSegment(polygon[3], polygon[5]), true));
  ear.anim.add(new AnimationShape(new LineSegment(polygon[6], polygon[2]), true));
  ear.anim.add(new AnimationShape(new LineSegment(polygon[3], polygon[6]), true));

  //gift wrapping
}

void draw() {
  background(255);
  //Render all buttons
  start.Render();
  stop.Render();
  reset.Render();
  if (start.MouseOver() || stop.MouseOver() || reset.MouseOver())
    cursor(HAND);
  else
    cursor(ARROW);
  horizontalAxis.Render();
  verticalAxis.Render();

  switch(algorithm) {
  case Diagonal:
    //slow down
    if (frameCount % 10 == 0)
      diagonal.Tick();
    diagonal.Render();
    break;
  case EarBased:
    //slow down
    if (frameCount % 10 == 0)
      ear.Tick();
    ear.Render();
    break;
  case GiftWrapping:
    wrap.Tick();
    wrap.Render();
    break;
  }
}

void mouseClicked() {
  if (start.ExecuteCLick()) {
    switch(algorithm) {
    case Diagonal:
      diagonal.Start();
      break;
    case EarBased:
      ear.Start();
      break;
    case GiftWrapping:
      wrap.Start();
      break;
    }
  }

  if (stop.ExecuteCLick()) {
    switch(algorithm) {
    case Diagonal:
      diagonal.Stop();
      break;
    case EarBased:
      ear.Stop();
      break;
    case GiftWrapping:
      wrap.Stop();
      break;
    }
  }

  if (reset.ExecuteCLick()) {
    switch(algorithm) {
    case Diagonal:
      diagonal.Reset();
      break;
    case EarBased:
      ear.Reset();
      break;
    case GiftWrapping:
      wrap.Reset();
      break;
    }
  }
}

//X coordinate to pixel position
int XtoP(int x) {
  return MidX + (x * width / 20);
}

int YtoP(int y) {
  return MidY - (y * height / 20);
}