public class LevelScene extends Scene{

    GameObject go;
    
    boolean firstRun = true;

    public LevelScene(){        
        
    }
    
    public void Init(String name){
        System.out.println("Inside level scene");
        super.Init("Level Scene");     
        
        this.clearColor = new Vector4(1,0,0,1);

        go = new GameObject("harry", new Vector2(400, 400), new Vector2(50,50));
        
        BoxCollider col = new BoxCollider(go);        
        SpriteRenderer rend = new SpriteRenderer(go, "apple.png");

        go.AddComponent(rend);
        go.AddCollider(col);
        
        AddGameobjectToScene(go);
    }
        
    public void FixedUpdate(float dt){
        super.FixedUpdate(dt);
    }
    
    public void Update(float dt){
      
      super.Update(dt);  
      
      if(firstRun){
          firstRun = false; 
          return;
      }
    }
    
    public void Render(){
        super.Render();
    }
}
