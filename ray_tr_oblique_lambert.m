close all;
clear all;

% orthographic case

%-----
%%%   @autor: lucas sousa
%%%   @data:  02/10/2017
%%%   @email: lucasssousa10@gmail.com
%%%   @description: Ray-tracing com visÃ£o ortogrÃ¡fica e Lambert shadding
%-----

% Cube
side = 3;
objetos = create_cube([-1 -1 1], side);

centroCu = centroCubo(objetos);

%image parameters
nx = 200;
ny = 200;

l = -4;
r = 4;
t = 4;
b = -4;

% Z View
% e = [0 0 1];

% Y View
% e = [0 1 0]

% X View
% e = [3 0 0]

% Cool view
e = [-1 -0.4 1]


ww = e/norm(e);
[uu, vv] = buildBasis(ww);

image = zeros(ny, nx, 3);

for(i = 1 : nx)
    for(j = 1 : ny)
        
        u = l + ((r - l)*(i + 0.5))/nx;
        v = b + ((t - b)*(j + 0.5))/ny;
            
        origin = e + u * uu  + v * vv;
        direction = -ww;
        
        menorTT = inf;
        indMenor = -1;
        for(ob = 1 : size(objetos, 2))
        
            tt = dot((objetos{ob}.p1 - origin), objetos{ob}.normal) / dot(direction, objetos{ob}.normal);
            p = origin + tt * direction;
    
            aiDento = p(1) >= objetos{ob}.minX & p(1) <= objetos{ob}.maxX & p(2) >= objetos{ob}.minY & p(2) <= objetos{ob}.maxY & ...
                      p(3) >= objetos{ob}.minZ & p(3) <= objetos{ob}.maxZ;
            if(aiDento & menorTT > tt) 
                menorTT = tt;
                indMenor = ob;    
            end
        end
        
        if(indMenor ~= -1)
            image(i, j, 1) = objetos{indMenor}.rgb(1);
            image(i, j, 2) = objetos{indMenor}.rgb(2);
            image(i, j, 3) = objetos{indMenor}.rgb(3); 
        end
           
        
    end
end

figure, imshow(image);
imwrite(image, 'teste.png');




