% Clean up pour retirer les anciens prog
clear all;
close all;

pixels_x = 100;
pixels_y = 100;

image = zeros(pixels_x, pixels_y);

for i = 1:pixels_x
    for j = 1:pixels_y
        check = i + j;
        if mod(check, 2) == 0
            image(i, j) = 1;
        end
    end
end

imshow(image);
