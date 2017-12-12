function q = create_square(bl, size, invariant, color)

    q.p1 = bl;
    
    % X is not changing
    if invariant == 1
        q.p2 = [bl(1), bl(2), bl(3) + size];
        q.p3 = [bl(1), bl(2) + size, bl(3) + size];
        q.p4 = [bl(1), bl(2) + size, bl(3)];
    end
    
    % Y is not changing
    if invariant == 2
        q.p2 = [bl(1), bl(2), bl(3) + size];
        q.p3 = [bl(1) + size, bl(2), bl(3) + size];
        q.p4 = [bl(1) + size, bl(2), bl(3)];
    end
    
    % Z is not changing
    if invariant == 3
        q.p2 = [bl(1) + size, bl(2), bl(3)];
        q.p3 = [bl(1) + size, bl(2) + size, bl(3)];
        q.p4 = [bl(1), bl(2) + size, bl(3)];
    end
    
    q.rgb  = color;
    q.centro =  mean([bl; q.p2; q.p3; q.p4]);
    q.normal = cross(bl - q.centro, q.p2 - q.centro);

    q.minX = min([q.p1(1); q.p2(1); q.p3(1); q.p4(1)]);
    q.maxX = max([q.p1(1); q.p2(1); q.p3(1); q.p4(1)]);
    q.minY = min([q.p1(2); q.p2(2); q.p3(2); q.p4(2)]);
    q.maxY = max([q.p1(2); q.p2(2); q.p3(2); q.p4(2)]);
    q.maxZ = max([q.p1(3); q.p2(3); q.p3(3); q.p4(3)]);
    q.minZ = min([q.p1(3); q.p2(3); q.p3(3); q.p4(3)]);
    
end
