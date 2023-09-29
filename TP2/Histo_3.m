clear all;
close all;

% Load the input image (replace 'your_image.jpg' with the path to your image)
image = imread('perroquet_2D.gif');

% Ensure the image is in grayscale (convert if necessary)
if size(image, 3) == 3
    image = rgb2gray(image);
end

% Calculate the histogram of the original image
histogram_orig = hist(image(:), 0:255);

% Calculate the cumulative histogram of the original image
histogram_cumulative_orig = cumsum(histogram_orig);

% Display the original image, its histogram, and its cumulative histogram
subplot(3, 3, 1);
imshow(image);
title('Original Image');
subplot(3, 3, 2);
bar(0:255, histogram_orig);
xlabel('Gray Levels');
ylabel('Frequency');
title('Histogram of Original Image');
subplot(3, 3, 3);
plot(0:255, histogram_cumulative_orig);
xlabel('Gray Levels');
ylabel('Cumulative Frequency');
title('Cumulative Histogram of Original Image');

% Stretching the Histogram
intensity_min = min(image(:));
intensity_max = max(image(:));
image_stretched = uint8((double(image) - intensity_min) * (255 / (intensity_max - intensity_min)));

% Calculate the histogram of the stretched image
histogram_stretched = hist(image_stretched(:), 0:255);

% Calculate the cumulative histogram of the stretched image
histogram_cumulative_stretched = cumsum(histogram_stretched);

% Display the stretched image, its histogram, and its cumulative histogram
subplot(3, 3, 4);
imshow(image_stretched);
title('Stretched Image');
subplot(3, 3, 5);
bar(0:255, histogram_stretched);
xlabel('Gray Levels');
ylabel('Frequency');
title('Histogram of Stretched Image');
subplot(3, 3, 6);
plot(0:255, histogram_cumulative_stretched);
xlabel('Gray Levels');
ylabel('Cumulative Frequency');
title('Cumulative Histogram of Stretched Image');

% Equalizing the Histogram
image_equalized = histeq(image);

% Calculate the histogram of the equalized image
histogram_equalized = hist(image_equalized(:), 0:255);

% Calculate the cumulative histogram of the equalized image
histogram_cumulative_equalized = cumsum(histogram_equalized);

% Display the equalized image, its histogram, and its cumulative histogram
subplot(3, 3, 7);
imshow(image_equalized);
title('Equalized Image');
subplot(3, 3, 8);
bar(0:255, histogram_equalized);
xlabel('Gray Levels');
ylabel('Frequency');
title('Histogram of Equalized Image');
subplot(3, 3, 9);
plot(0:255, histogram_cumulative_equalized);
xlabel('Gray Levels');
ylabel('Cumulative Frequency');
title('Cumulative Histogram of Equalized Image');
