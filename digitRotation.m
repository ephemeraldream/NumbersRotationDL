function rotatedImage = digitRotation(image, angle)


input_image = image;

H=size(input_image,1);
W=size(input_image,2); 

th=angle*pi/180;

s0 = 2;
s1 = 2;

x0 = -W/2;
x1 = -H/2;

T=[1 0 x0 ; ...
   0 1 x1 ; ...
   0 0 1];

RST = [ (s0*cos(th))   (-s1*sin(th)) ((s0*x0*cos(th))-(s1*x1*sin(th))); ...
        (s0*sin(th))   (s1*cos(th))   ((s0*x0*sin(th))+(s1*x1*cos(th))); ...
        0   0   1];

M=inv(T)*RST;
N = inv(M);

rotatedImage=zeros(H,W,size(input_image,3));

for i=1:W
    for j=1:H

        x = [i ; j ; 1];
        y = N * x;

        a = y(1)/y(3);
        b = y(2)/y(3);



        x1 = floor(a);
        y1 = floor(b);


        if ((x1 >= 2) && (y1 >= 2) && (x1 <= W-2) && (y1 <= H-2))

            P = input_image(y1-1:y1+2, x1-1:x1+2);


            dx = a - x1;
            dy = b - y1;
            rotatedImage(j, i) = bicubic(P, dx, dy);
        end
    end
end
end



function q = cubic(p, x)
q = p(2) + 0.5 * x*(p(3) - p(1) + x*(2.0*p(1) - 5.0*p(2) + 4.0*p(3) - p(4) + x*(3.0*(p(2) - p(3)) + p(4) - p(1))));
end 


function q = bicubic(p, x, y)
q1 = cubic(p(1,:), x);
q2 = cubic(p(2,:), x);
q3 = cubic(p(3,:), x);
q4 = cubic(p(4,:), x);
q = cubic([q1, q2, q3, q4], y);
end