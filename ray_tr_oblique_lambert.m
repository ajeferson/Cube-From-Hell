close all;
clear all;

% orthographic case

%-----
%%%   @autor: lucas sousa
%%%   @data:  02/10/2017
%%%   @email: lucasssousa10@gmail.com
%%%   @description: Ray-tracing com visÃ£o ortogrÃ¡fica e Lambert shadding
%-----

% objects 

objetos = {};
side = 1;


% Colors
red =    [255 0 0];       % Front
blue =   [0 0 255];       % Back
green =  [0 255 0];       % Bottom
yellow = [255 255 0];     % Top
pink =   [255 0 255];     % Left
white =  [255, 255, 255]; % Right

% Front
front = create_face([0, 0, 0], side, 3, red);
objetos = [objetos, front];

% Back
back = create_face([0, 0, -3], side, 3, blue);
objetos = [objetos, back];

% Bottom
bottom = create_face([0, 0, -3], side, 2, green);
objetos = [objetos, bottom];

% Top
top = create_face([0 3 -3], side, 2, yellow);
objetos = [objetos, top];

% Left
left = create_face([0 0 -3], side, 1, pink);
objetos = [objetos, left];

% Right
right = create_face([3 0 -3], side, 1, white);
objetos = [objetos, right];

centroCu = centroCubo(objetos);

%image parameters
nx = 200;
ny = 200;

l = -3;
r = 3;
t = 3;
b = -3;

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




