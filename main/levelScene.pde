public class LevelScene extends Scene{

    GameObject go;
    GameObject go2;
    BoxCollider col; 
    BoxCollider col2; 
    
    boolean firstRun = true;
    
    public LevelScene(){        
        
    }
    
    public void Init(String name){
        System.out.println("Inside level scene");
        super.Init("Level Scene");     
        
        this.clearColor = new Vector4(1,0,0,1);

        go = new GameObject("harry", new Vector2(400, 400), new Vector2(50,50));
        col = new BoxCollider();        
        SpriteRenderer rend = new SpriteRenderer("apple.png");
        go.AddComponent(rend);
        go.AddCollider(col);        
        AddGameobjectToScene(go);
            
        go2 = new GameObject("henk", new Vector2(400, 450), new Vector2(50,50));          
        col2 = new BoxCollider();        
        SpriteRenderer rend2 = new SpriteRenderer("apple.png");        
        go2.AddComponent(rend2);
        go2.AddCollider(col2);                
        AddGameobjectToScene(go2);
    }
        
    public void FixedUpdate(float dt){
        super.FixedUpdate(dt);        
        
        if(Collision.PointInBox(mouseX, mouseY, col)){
            print("Mouse colliding with: " + col.GetParent().GetName() + "\n");
        }
        
        for(Collider col : go.GetCollider(BoxCollider.class).GetCollisions())
        {
          print(
              col.GetParent().GetName() + "\n" 
          );      
        }
                
        go.transform.position.y += 10 * dt; //Right way to change position because this is frame dependent       
    }
    
    public void Render(){
        super.Render();
    }
}
