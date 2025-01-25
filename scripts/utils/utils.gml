function inv_lerp(a, b, val)
{
	// Inverse Linar Interpolation, get the fraction between a and b on which v resides.
    // Examples
    // --------
    //     0.5 == inv_lerp(0, 100, 50)
    //     0.8 == inv_lerp(1, 5, 4.2)
	//
	return (val - a) / (b - a)
}