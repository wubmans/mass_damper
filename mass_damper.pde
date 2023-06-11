ArrayList<MSDSystem> systems = new ArrayList<MSDSystem>();

int numberSegments = 6;
int numberSystems = 150;

/**********************************



grass


***********************************/

void setup()
{

    size(800, 800);

    for (int j = 0; j < numberSystems; j++)
    {
        MSDSystem system = new MSDSystem();

        for(int i = 0; i < numberSegments; i++)
        {
            Segment segment = new Segment();
            segment.length = 50;
            segment.F = random(1) * 0.2f;
            system.addSegment(segment);
        }

        system.basePoint = new PVector(50 + j * 5, 600 + random(15));
        systems.add(system);

    }
  
}

void draw()
{
    background(128);

    for (MSDSystem system : systems)
    {
        system.update();
        system.render(); 
    }

}

void mouseMoved() 
{
    
    for (MSDSystem system : systems)
    {
        float distance = mouseX - system.basePoint.x;
        if (distance == 0)
        {
            distance = 1;
        }
        float f = 0.1f / distance;

        // maximize the force to make sure no weird effect of the grass folding backwards on itself
        if (abs(f) > 0.001f)
        {
            f = f > 0 ? 0.001f : -0.001f;
        }

        for (Segment segment : system.segments)
        {
            segment.F += f;
        }
    }

}