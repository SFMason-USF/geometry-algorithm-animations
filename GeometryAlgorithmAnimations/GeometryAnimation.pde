class GeometryAnimation {
  protected int time;
  //If not enabled, this animation will not tick. If not visible, this animation will not tick or render
  public boolean enabled, visible;
  //Will always be rendered at any point in the animation
  public ArrayList<Shape> base;
  //Will be rendered sequentially as the algorithm progresses
  public ArrayList<AnimationShape> anim;

  public GeometryAnimation() {
    this.time = 0; 
    this.enabled = false;
    this.visible = true;
    this.base = new ArrayList<Shape>();
    this.anim = new ArrayList<AnimationShape>();
  }

  public void Start() {
    if (this.visible)
      this.enabled = true;
  }

  public void Stop() {
    this.enabled = false;
  }

  public void Reset() {
    this.Stop();
    this.time = 0;
  }

  //Advance time
  public void Tick() {
    if (visible && enabled && time < anim.size())
      ++time;
  }

  //Render all elements in the initial graph,
  //plus all elements to be rendered at the current time
  public void Render() {
    if (!visible)
      return;

    for (Shape s : base) {
      s.Render();
    }

    for (int i = 0; i < time; ++i) {
      //if we're on the current shape in the sequence or the shape we're
      //looking at is marked persistent
      if (i == (time - 1) || anim.get(i).persistent)
        anim.get(i).shape.Render();
    }
  }
}