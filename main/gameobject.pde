class GameObject{

    private ArrayList<Component> components = new ArrayList<Component>();
    private ArrayList<Collider> colliders = new ArrayList<Collider>();
        
    private HashMap<String,AudioSource> audioSources = new HashMap<String,AudioSource>();
    
    public Transform transform =  new Transform();
    
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
      
      for (Component co : components) {            
          co.Render(camera);
      }

      if(Window.get().GetCurrentScene().visualizeColliders)
      {
        for (Collider col : colliders) {            
          col.Visualize();
        }
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
    }
    
    public void AddCollider(Collider col){
      this.colliders.add(col);        
    }
    
    public void AddAudioSource(String identifier, AudioSource src){
        this.audioSources.put(identifier ,src);
    }

    public AudioSource GetAudioSource(String identifier){
      return this.audioSources.get(identifier);
    }        
    
    public <T extends Component> T GetComponent(Class<T> componentClass) {
      for (Component c : components) {
          if (componentClass.isAssignableFrom(c.getClass())) {
            try {
              return componentClass.cast(c);
            } catch (ClassCastException e) {
              e.printStackTrace();
              assert false : "Error: Casting component.";
          }
        }
      }
      return null;
    }
    
    public <T extends Collider> T GetCollider(Class<T> colliderClass) {
      for (Collider col : colliders) {
          if (colliderClass.isAssignableFrom(col.getClass())) {
            try {
              return colliderClass.cast(col);
            } catch (ClassCastException e) {
              e.printStackTrace();
              assert false : "Error: Casting component.";
          }
        }
      }
      return null;
    }

    public String GetName(){
      return this.name;
    }
    
}
