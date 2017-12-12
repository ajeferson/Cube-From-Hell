function [ u, v ] = buildBasis( w )

    t = w;
    
    [~, p] = min(abs(w));
    t(p) = 1;
    
    u = cross( t, w )/norm(cross(t, w));
    v = cross(w, u);
    
end

