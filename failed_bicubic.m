function J = failed_bicubic(I, angle)
% Performs bicubic interpolation-based image rotation

[m, n, ~] = size(I);

% Compute coordinates of output image
[x, y] = meshgrid(1:n, 1:m);
x_center = (n+1)/2;
y_center = (m+1)/2;
x_rotated = (x - x_center)*cosd(angle) - (y - y_center)*sind(angle) + x_center;
y_rotated = (x - x_center)*sind(angle) + (y - y_center)*cosd(angle) + y_center;

% Pad input image to avoid black borders
I_padded = padarray(I, ceil(sqrt(2)*(max(m,n)-min(m,n))/2)*[1 1]);

% Compute bicubic interpolation by convolving with kernel
kernel = @(t) cat(3, (1-t).^3, 3*(t-1).^2.*t, 3*(1-t).*t.^2, t.^3);
k = repmat(reshape([-1:1], [1 1 3]), [3 3 1]);
w = min(floor(x_rotated)-1, size(I_padded,2)-2);
h = min(floor(y_rotated)-1, size(I_padded,1)-2);
t = x_rotated - w - 1;
u = y_rotated - h - 1;
weight = sum(kernel(t).u.*k(1:h(1)+3,1:w(1)+3,:), 3);
J = sum(weight.I_padded(h:(h+4), w:(w+4), :), [1 2]) ./ sum(weight, [1 2]);

% Scale output image back to original size
J = reshape(J, [size(x_rotated') 3]);
J = J(1:m, 1:n, :);