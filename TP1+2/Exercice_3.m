clear all;
close all;

image = zeros(4,7);
shade = 0;

for i = 1:7
    image(1:4,i) = [shade,shade,shade,shade];
    shade = shade + (1/6);
end

imshow(image);