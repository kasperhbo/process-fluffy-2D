import java.util.Map;

public abstract class Scene{
  
  protected String name;    
  
  protected Camera camera;
  protected Vector4 clearColor;
  
  private HashMap<String, GameObject> gameObjects = new HashMap<String, GameObject>();   
  private AudioSource bgMusic = null;
  
  private boolean visualizeColliders = true;
    
  public Scene(){}
  
  public void Init(String name) {
      this.name = name;
      this.camera = new Camera();
      this.clearColor = new Vector4(1,1,1,1);
  }

  public void Init(String name, Vector4 clearColor){
    this.name = name;
    this.camera = new Camera();
    this.clearColor = clearColor;
  }  

  public void Init(String name, Vector4 clearColor, Vector2 cameraPosition){
    this.name = name;
    this.camera = new Camera(cameraPosition);
    this.clearColor = clearColor;
  }

  
  public void AddGameobjectToScene(GameObject go)
  {
    gameObjects.put(go.GetName(), go);
  }
  
  public void AddGameobjectsToScene(GameObject[] gos)
  {
    for(GameObject go : gos)
      gameObjects.put(go.GetName(), go);
  }
  
  public void FixedUpdate(float dt){
    for (Map.Entry obj : gameObjects.entrySet()) {
      GameObject go = gameObjects.get(obj.getKey());
      go.FixedUpdate(dt);
    }
  }
  
  public void Update(float dt){
    for (Map.Entry obj : gameObjects.entrySet()) {
      GameObject go = gameObjects.get(obj.getKey());
      go.Update(dt);
    }
  }
  
  protected void AddBackgroundMusic(AudioSource src){
    this.bgMusic = src;
  }
  
  protected void PlayBackgroundMusic(){
    this.bgMusic.Play();
  }
  
  protected void StopBackgroundMusic(){
    this.bgMusic.Stop();
  }
  
  protected GameObject GetGameObjectInScene(String identifier) throws Exception {
    if(gameObjects.containsKey(identifier)) {
      return gameObjects.get(identifier);
    }
    else {
      throw new Exception("Gameobject not found with name: "+ identifier);
    }
  }
  
  public void Render(){
    translate(camera.transform.position.x, camera.transform.position.y);
    
    //Color is normalized
    background((int)clearColor.x * 255, (int)clearColor.y * 255, (int)clearColor.z * 255, (int)clearColor.w * 255);
          
    for (Map.Entry obj : gameObjects.entrySet()) {
      GameObject go = gameObjects.get(obj.getKey());
      go.Render(camera);
    }
  } 
  
  public void SetVisualizeColliders(boolean visualizeColliders){
    this.visualizeColliders = visualizeColliders;
  }    

  public boolean VisualizeColliders(){
    return this.visualizeColliders;
  }       
}
