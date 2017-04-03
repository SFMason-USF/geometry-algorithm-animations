class GeometryAnimation {
  protected int time;
  protected boolean enabled, visible;
  protected Point[] polygon;

  public GeometryAnimation(Point[] polygon) {
    this.time = 0; 
    this.enabled = false;
    this.visible = true;
    this.polygon = polygon;
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

  public void Tick() {
    ++this.time;
  }
}