squareSize = 100;

image = zeros(squareSize,squareSize);

for i = 1:squareSize
    temp = zeros(1,squareSize);
    temp(:) = i*(1/squareSize);
    image(i,1:squareSize) = temp;
end

imshow(image);
