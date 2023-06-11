class MSDSystem
{
    PVector basePoint;

    ArrayList<Segment> segments = new ArrayList<Segment>();

    void update()
    {
        for (int i = 0; i < segments.size() ; i++)
        {
            Segment segment = segments.get(i);
            Segment previous = i > 0 ? segments.get(i - 1) : null;
            Segment next = i < segments.size() - 1 ? segments.get(i + 1) : null;

            segment.update(previous, next);
        }

    }

    void addSegment(Segment segment)
    {
        segments.add(segment);
    }


    void renderAsGears()
    {
        //Point point;

        pushMatrix();

        // fill(160);
        // circle(400, 400, 200);
        translate(basePoint.x, basePoint.y);

        for(int i = 0; i < segments.size(); i++)
        {   circleImage = loadImage("./zencircle.png");
            Segment segment = segments.get(i);
            rotate(segment.a);

            tint(255, 255 - i * 50);
            circleImage.resize(100 * (i + 1), 100 * (i + 1));
            
            image(circleImage, -50 * (i + 1), -50 * (i + 1));
            // stroke(0);
            // strokeWeight(4);
            // line(0, 0, 0, segment.length);
            // translate(0, segment.length);

            // fill(100);
            // circle(0, -70, 20);
        }



        popMatrix();

    }

    void renderAsLines()
    {
        pushMatrix();
        translate(basePoint.x, basePoint.y);

        for(int i = 0; i < segments.size(); i++)
        {   
            Segment segment = segments.get(i);
            rotate(segment.a);

            // tint(255, 255 - i * 50);
            // circleImage.resize(100 * (i + 1), 100 * (i + 1));
            
            // image(circleImage, -50 * (i + 1), -50 * (i + 1));
            stroke(100, 128 + i * 10, 100);
            strokeWeight(4.0f + random(0.5));
            line(0, 0, 0, - segment.length);
            translate(0, - segment.length);

            // fill(100);
            // circle(0, -70, 20);
        }



        popMatrix();

    }

}