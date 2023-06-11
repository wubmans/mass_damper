ArrayList<MSDSystem> systems = new ArrayList<MSDSystem>();

int numberSegments = 6;
int numberSystems = 200;
PImage circleImage; 

void setup()
{
    circleImage = loadImage("./gear.png");

  //  system = new MSDSystem();

    size(800, 800);
    //ellipse(80.0f, 80.0f, 30.0f, 30.0f);

    for (int j = 0; j < numberSystems; j++)
    {
        MSDSystem system = new MSDSystem();



        for(int i = 0; i < numberSegments; i++)
        {
            Segment segment = new Segment();
            //segment.a = random(3) * 4;
            //segment.F = 5;
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
        system.renderAsLines(); 
    }

}

void mouseMoved() {
    
    for (MSDSystem system : systems)
    {
        float distance = mouseX - system.basePoint.x;
        if (distance == 0)
        {
            distance = 1;
        }
        float f = 0.1f / distance;

        for (Segment segment : system.segments)
        {
            segment.F += f;
        }
    }

}