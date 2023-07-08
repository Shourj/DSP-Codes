% Step 1: Preprocess the image
image = imread('download.jpg');
grayImage = rgb2gray(image);

% Step 2: Detect the graph lines
edges = edge(grayImage, 'Canny');
[H, theta, rho] = hough(edges);
peaks = houghpeaks(H, 10, 'threshold', ceil(0.3 * max(H(:)))); % Adjust the threshold as needed
lines = houghlines(edges, theta, rho, peaks);

% Step 3: Extract the coordinates of the data points
cornerPoints = lineIntersections(lines);
croppedImage = cropImage(image, cornerPoints);
dataPoints = extractDataPoints(croppedImage);

% Step 4: Curve fitting and equation extraction
x = dataPoints(:, 1);
y = dataPoints(:, 2);

% Perform curve fitting
% Example: Polynomial curve fitting of degree 2
coefficients = polyfit(x, y, 2);

% Generate the equation
equation = generateEquation(coefficients);

% Display the graph and equation
imshow(image);
hold on;
plot(dataPoints(:, 1), dataPoints(:, 2), 'ro'); % Plot the extracted data points
title('Graph with extracted data points');
hold off;

% Display the equation on the image
text(20, 40, equation, 'Color', 'red', 'FontSize', 12, 'FontWeight', 'bold');

% Print the equation
disp('Equation of the graph:');
disp(equation);
