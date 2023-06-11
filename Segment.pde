class Segment 

{
    float F = 0;
    float v = 0;
    float a = 0;
    

    //float mass = 1;

    // gears

    // float springConstant = 3000;
    // float dampingConstant = 0.01;

    float springConstant = 50;
    float dampingConstant = 0.3;

    float length;

    void update(Segment previous, Segment next)
    {
        float force = -F;
        float velocity = v;
        //float a = 0;

        //force = F;

        if (next != null)
        {
            force += next.F;
        }

        force *= dampingConstant;

        velocity += force; /// mass;
        v = velocity;

        if (previous != null)
        {
            velocity -= previous.v;
        }

        a += velocity;

        F = velocity;
        F += a / springConstant;
        


    }
}