public abstract class Component{
  
    protected GameObject gameObject;

    public void Init(GameObject go)
    {
        this.gameObject = go;
    }

    public abstract void Render(Camera camera);
    public abstract void FixedUpdate(float dt);
}
