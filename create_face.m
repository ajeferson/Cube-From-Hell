function face = create_face(bl, side, invariant, color)

    face = {};

    if invariant == 1
    end
    
    if invariant == 2
        for i = bl(3) : bl(3)+2
            for j = bl(1) : bl(1)+2
                square = create_square([j, bl(2), i], side, 2, color);
                face = [face, square];
            end
        end
    end

    if invariant == 3
        for i = bl(2) : bl(2)+2
            for j = bl(1) : bl(1)+2
                square = create_square([j, i, bl(3)], side, 3, color);
                face = [face, square];
            end
        end
    end

end