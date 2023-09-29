clear all;
close all;

img = imread('exo1.jpeg');

if size(img, 3) == 3
    img = rgb2gray(img);
end

image_stretched = imadjust(img, stretchlim(img), []);

image_equalized = histeq(image_stretched);

[NL, NC] = size(image_equalized);
image_denoized = zeros(NL, NC);

filter_size = 3;

padding = floor(filter_size / 2);

for y = 2:NL-1  % Avoid processing the image boundaries
    for x = 2:NC-1
        A = image_equalized(y-1:y+1, x-1:x+1);
        mid_val = median(A(:));
        image_denoized(y, x) = mid_val;
    end
end

% Create a figure
figure;

% Display the Original Image and its histogram
subplot(2, 4, 1);
imshow(img);
title('Original Image');

subplot(2, 4, 5);
imhist(img);
title('Histogram');

% Display the Stretched Image and its histogram
subplot(2, 4, 2);
imshow(image_stretched);
title('Stretched Image');

subplot(2, 4, 6);
imhist(image_stretched);
title('Histogram');

% Display the Equalized Image and its histogram
subplot(2, 4, 3);
imshow(image_equalized);
title('Equalized Image');

subplot(2, 4, 7);
imhist(image_equalized);
title('Histogram');

% Display the Equalized Image and its histogram
subplot(2, 4, 4);
imshow(image_denoized);
title('Denoised Image');

subplot(2, 4, 8);
imhist(image_denoized);
title('Histogram');
