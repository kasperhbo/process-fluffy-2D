void setup() {    
    size(1920, 1080);
    
    SceneSettings sc = new SceneSettings(true);
    
    Window.get().Start(sc, new LevelScene());
}

void draw() {
    Window.get().Render();
}
