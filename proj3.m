% Read the color image
image = imread('download21.jpg');

% Convert the image to grayscale
grayImage = im2gray(image);

% Convert the grayscale image to a matrix
matrix = double(grayImage);

% Generate x, y, and z data for surface fitting
[x, y] = meshgrid(1:size(matrix, 2), 1:size(matrix, 1));
xData = x(:);
yData = y(:);
zData = matrix(:);



% Display the modified matrix
disp(matrix);

% Convert the matrix into grid pixel form
[X, Y] = meshgrid(1:size(matrix, 2), 1:size(matrix, 1));
Z = matrix;

% Plot the graph
figure;
surf(X, Y, Z);
xlabel('X');
ylabel('Y');
zlabel('Intensity');
title('Grayscale Image in Grid Pixels Form');
