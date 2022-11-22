class Camera{
    public Transform transform = new Transform();
    
    public Camera()
    {
        transform.position = new Vector2();
        transform.scale = new Vector2();
    }

    public Camera(Vector2 position)
    {
        transform.position = position;
        transform.scale = new Vector2();
    }
}
