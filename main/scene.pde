import java.util.Map;
import java.util.ArrayList;
import java.util.List;

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
    
    CollisionCheck();
  }
  
  public void Render(){
    //Color is normalized
    background((int)clearColor.x * 255, (int)clearColor.y * 255, (int)clearColor.z * 255, (int)clearColor.w * 255);
    
    translate(camera.transform.position.x, camera.transform.position.y);    
          
    for (Map.Entry obj : gameObjects.entrySet()) {
      GameObject go = gameObjects.get(obj.getKey());
      go.Render(camera);
    }   

  } 
  
  public void CollisionCheck(){    
    //UpdateColliders //TODO: Add this
    for (Map.Entry obj : gameObjects.entrySet()) {
      GameObject go1 = gameObjects.get(obj.getKey());
      
      for (Collider col : go1.colliders) {
        col.ClearCollisions();
      }

      for (Map.Entry obj1 : gameObjects.entrySet()) {
        
        GameObject go2 = gameObjects.get(obj1.getKey());
        
        for (Collider col1 : go1.colliders) {
        
          for (Collider col2 : go2.colliders) {            
            if(col1 != col2){
              if(col1.getClass() == BoxCollider.class && col2.getClass() == BoxCollider.class){
                if(Collision.RectRect((BoxCollider)col1, (BoxCollider)col2)){ 
                  if(Collision.RectRect((BoxCollider)col1, (BoxCollider)col2)){                        
                    col1.collisions.add(col2);                
                  }
                }
                //TODO: ADD CIRCLE COLLIDERS
                // else if(Collision.RectRect((CircleCollider)col1, (BoxCollider)col2)){ 
  
                // }
              }
            }
          }
        }       
      }
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
    
  public void SetVisualizeColliders(boolean visualizeColliders){
    this.visualizeColliders = visualizeColliders;
  }    

  public boolean VisualizeColliders(){
    return this.visualizeColliders;
  }       
}
