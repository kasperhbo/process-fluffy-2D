private Scene currentScene = null;

float beginTime = getTime();
float endTime;
float dt = -1.0f;

void setup() {
    currentScene = new levelScene();
    size(800, 800);
}

void draw() {   

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
