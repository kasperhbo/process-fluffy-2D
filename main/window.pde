public static class Window{

    private static Window window = null;
    private static Scene currentScene = null;

    float beginTime = getTime();
    float endTime;
    float dt = -1.0f;
    
    public Window(){
      
    }
    
    public void Start(SceneSettings sc, Scene startingScene){        
        currentScene = startingScene;
        currentScene.SetVisualizeColliders(sc.visualizeColliders);
        currentScene.Init("test");  
    }
    
    public static Window get() {        
        
        if (Window.window == null){
            Window.window = new Window();
        }
        
        return Window.window;
    }
    
    public static Scene GetCurrentScene(){
      return currentScene;
    }

    
    public void Render(){
        if (dt >= 0) {
            currentScene.FixedUpdate(dt);
        }
        
        currentScene.Update(dt);
        currentScene.Render();
        
        endTime = getTime();
        dt = endTime - beginTime;
        beginTime = endTime;
    }  

    private float timeStarted = System.nanoTime();

    private float getTime() 
    { 
        return (float)((System.nanoTime() - timeStarted) * 1E-9); 
    }
    
}
