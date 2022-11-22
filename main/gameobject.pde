class GameObject{

    private ArrayList<Component> components = new ArrayList<Component>();
    public Transform transform =  new Transform();    
    public Transform renderTransform = new Transform();
    public String name = "";
    
    public GameObject(String name)
    {
        this.name = name;
        transform.position = new Vector2();
        transform.scale = new Vector2();
    } 

    
    public GameObject(String name, Vector2 scale)
    {
        this.name = name;
        transform.position = new Vector2();
        transform.scale = scale;
    } 

    public GameObject(String name, Vector2 position, Vector2 scale)
    {
        this.name = name;
        transform.position = position;
        transform.scale = scale;   
    }

    public void Render(Camera camera){        
        fill(0,0,0,0);     
        
        renderTransform.position.x = transform.position.x - camera.transform.position.x;
        renderTransform.position.y = transform.position.y + camera.transform.position.y;
        renderTransform.rotationAngle = transform.rotationAngle;
        
        for (Component co : components) {            
            co.Render(camera);
        }

    }

    public void FixedUpdate(float dt){
        for (Component co : components) {
            co.FixedUpdate(dt);
        }
    }
    
    public void Update(float dt){
        for (Component co : components) {
            co.Update(dt);
        }
    }

    public void AddComponent(Component component){
        this.components.add(component);
        component.Start(this);
    }
}
