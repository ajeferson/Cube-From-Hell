function face = create_face(bl, side, invariant, color)

    face = {};

    % Face on the YZ Plan
    if invariant == 1
        for i = bl(3) : bl(3)+2
            for j = bl(2) : bl(2)+2
                square = create_square([bl(1), j, i], side, 1, color);
                face = [face, square];
            end
        end
    end
    
    % Face on the XZ Plan
    if invariant == 2
        for i = bl(3) : bl(3)+2
            for j = bl(1) : bl(1)+2
                square = create_square([j, bl(2), i], side, 2, color);
                face = [face, square];
            end
        end
    end

    % Face on the XY Plan
    if invariant == 3
        for i = bl(2) : bl(2)+2
            for j = bl(1) : bl(1)+2
                square = create_square([j, i, bl(3)], side, 3, color);
                face = [face, square];
            end
        end
    end

end