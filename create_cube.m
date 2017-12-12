function cube = create_cube(bl, side)

    % Colors
    red =    [255 0 0];       % Front
    blue =   [0 0 255];       % Back
    green =  [0 255 0];       % Bottom
    yellow = [255 255 0];     % Top
    pink =   [255 0 255];     % Left
    white =  [255 255 255];   % Right

    front = create_face(bl, side/3, 3, red);
    back = create_face([bl(1) bl(2) bl(3)-3], side/3, 3, blue);
    top = create_face([bl(1) bl(2)+3 bl(3)-3], side/3, 2, yellow);
    bottom = create_face([bl(1) bl(2) bl(3)-3], side/3, 2, green);
    left = create_face([bl(1) bl(2) bl(3)-3], side/3, 1, pink);
    right = create_face([bl(1)+3 bl(2) bl(3)-3], side/3, 1, white);
    
    cube = [front, back, top, bottom, left, right];

end