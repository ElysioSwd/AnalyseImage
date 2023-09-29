% Load your image
image = imread('your_image.jpg'); % Replace 'your_image.jpg' with the path to your image

% Get the size of the image
[height, width, ~] = size(image);

% Reshape the image to a 2D matrix of RGB values
rgb_values = double(reshape(image, [], 3)) / 255; % Scale to [0, 1] range

% Create a scatter plot in 3D space
figure;
scatter3(rgb_values(:, 1), rgb_values(:, 2), rgb_values(:, 3), 10, rgb_values, 'filled');
xlabel('Red');
ylabel('Green');
zlabel('Blue');
title('3D Scatter Plot of Image Colors');
axis([0 1 0 1 0 1]); % Set axis limits to [0, 1] range
colormap('default'); % Use the default colormap
colorbar; % Add a colorbar to show RGB values
grid on;

% Adjust view angle
view(3);

% Pause to display the plot in the console
pause;
