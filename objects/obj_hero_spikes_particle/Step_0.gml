lifetime -= 1;

if (lifetime <= 0)
{
    radius += lifetime - 1;
    
    if (radius <= 0)
    {
        instance_destroy();
    }
}
else if (radius < target_radius)
{
    radius += 10;
}