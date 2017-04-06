class GeometryAnimation {
  protected int time;
  protected boolean enabled, visible;
  //Will always be rendered at any point in the animation
  protected Shape[] initialGraph;
  //Will be rendered sequentially as the algorithm progresses
  protected AnimationShape[] animationSteps;

  public GeometryAnimation() {
    this.time = 0; 
    this.enabled = false;
    this.visible = true;
  }

  //Advance time
  public void Tick() {
    //TODO: implement
  }

  //Render all elements in the initial graph,
  //plus all elements to be rendered at the current time
  public void Render() {
    //TODO: implement
  }
}