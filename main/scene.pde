public abstract class Scene{
  protected final String name;    
  
  protected Camera camera;
  protected Vector4 clearColor;
  
  private ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();
  
  public Scene(String name){
    this.name = name;
    this.camera = new Camera();
    this.clearColor = new Vector4(1,1,1,1);
  }  

  public Scene(String name, Vector4 clearColor){
    this.name = name;
    this.camera = new Camera();
    this.clearColor = clearColor;
  }  

  public Scene(String name, Vector4 clearColor, Vector2 cameraPosition){
    this.name = name;
    this.camera = new Camera(cameraPosition);
    this.clearColor = clearColor;
  }  
  
  public void AddGameobjectToScene(GameObject go)
  {
      gameObjects.add(go);
  }
  
  public void AddGameobjectsToScene(GameObject[] gos)
  {
      for(GameObject go : gos)
        gameObjects.add(go);
  }
  
  public void FixedUpdate(float dt){
    for(GameObject object : gameObjects) {
      object.FixedUpdate(dt);
    }
  }
  
  public void Update(float dt){
    for(GameObject object : gameObjects) {
      object.Update(dt);
    }
  }
  
  public void Render(){
    //Color is normalized
    background((int)clearColor.x * 255, (int)clearColor.y * 255, (int)clearColor.z * 255, (int)clearColor.w * 255);
        
    for(GameObject object : gameObjects) {
      object.Render(camera);
    }
  }        
}
