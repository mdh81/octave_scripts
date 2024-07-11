function genSphere(radius, center)
    numSubdivisions = 4;
    resolution = 32;
    diameter = 2 * radius;
    zincrement = diameter / numSubdivisions;
    for z = -radius : zincrement : radius
        vertices = [];
        circleRadius = radius - abs(z);
        if circleRadius < 1e-12
            vertices = [vertices; center + z];
        else
            for theta = 0 : 2*pi/resolution : 2*pi
                vertex = [radius * cos(theta), radius * sin(theta), z];
                vertices = [vertices; vertex];
            endfor
        end
        printf("Circle radius = %f Z = %f\n", circleRadius, z);
        disp(vertices);
    endfor 
endfunction
