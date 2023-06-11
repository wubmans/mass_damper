class MSDSystem
{
    PVector basePoint;
    
    float springConstant = 50;
    float dampingConstant = 0.3;

    ArrayList<Segment> segments = new ArrayList<Segment>();

    void update()
    {
        for (int i = 0; i < segments.size() ; i++)
        {
            Segment segment = segments.get(i);
            Segment previous = i > 0 ? segments.get(i - 1) : null;
            Segment next = i < segments.size() - 1 ? segments.get(i + 1) : null;

            segment.update(previous, next, this);
        }

    }

    void addSegment(Segment segment)
    {
        segments.add(segment);
    }

    void render()
    {
        pushMatrix();

        translate(basePoint.x, basePoint.y);

        for(int i = 0; i < segments.size(); i++)
        {   
            Segment segment = segments.get(i);
            
            rotate(segment.a);
            
            stroke(100, 128 + i * 10, 100);
            strokeWeight(4.0f + random(0.5));
            line(0, 0, 0, - segment.length);
            
            translate(0, -segment.length);
            
        }

        popMatrix();
    }
}