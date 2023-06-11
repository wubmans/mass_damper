class Segment 

{
    float F = 0;
    float v = 0;
    float a = 0;
    
    float length;

    void update(Segment previous, Segment next, MSDSystem system)
    {
        float force = -F;
        float velocity = v;

        if (next != null)
        {
            force += next.F;
        }

        force *= system.dampingConstant;

        velocity += force;
        v = velocity;

        if (previous != null)
        {
            velocity -= previous.v;
        }

        a += velocity;

        F = velocity;
        F += a / system.springConstant;

    }
}