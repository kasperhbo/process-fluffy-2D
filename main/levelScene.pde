public class levelScene extends Scene{

    GameObject go;
    boolean firstRun = true;

    public levelScene(){
        super("Level Scene");        
        this.clearColor = new Vector4(1,0,0,1);

        go = new GameObject("harry", new Vector2(400, 400), new Vector2(50,50));
        SpriteRenderer rend = new SpriteRenderer("apple.png");
        go.AddComponent(rend);
        AddGameobjectToScene(go);

    }
        
    public void FixedUpdate(float dt){
        super.FixedUpdate(dt);
        go.transform.position.x += 30 * dt;
    }
    
    public void Update(float dt){
        if(firstRun){
            firstRun = false; return;
        }
        // print(go.transform.position.x + "\n");
        super.Update(dt);
    }
    
    public void Render(){
        super.Render();
    }
}
