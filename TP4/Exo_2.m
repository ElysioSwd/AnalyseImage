clear all;
close all;

% Charger l'image originale
I = imread('lena.jpg');

% Ajouter du bruit gaussien et du bruit salt & pepper
I_gaussian = imnoise(I, 'gaussian', 0, 0.04);
I_sp = imnoise(I, 'salt & pepper', 0.04);


%Below is the algorithm for an average filter

%[NL, NC] = size(I_sp);
%image_denoized2 = zeros(NL, NC);

%for y = 2:NL-1  % Avoid processing the image boundaries
%    for x = 2:NC-1
%        A = I_sp(y-1:y+1, x-1:x+1);
%        avg_val = sum(sum(A))/9;
%        image_denoized2(y, x) = avg_val;
%    end
%end

filter_size = 3;

% Appliquer un filtre moyenneur rectangulaire 3x3 sur les images avec bruit
filter = fspecial('average', [filter_size, filter_size]);
I_gaussian_filtered = imfilter(I_gaussian, filter);
I_sp_filtered = imfilter(I_sp, filter);


% Appliquer un filtre médian sur l'image avec bruit salt & pepper
I_gaussian_median = medfilt2(I_gaussian, [filter_size, filter_size]);
% Appliquer un filtre médian sur l'image avec bruit salt & pepper
I_sp_median = medfilt2(I_sp, [filter_size, filter_size]);

% Afficher l'image originale
figure;
imshow(I);
title('Image originale');

% Afficher l'image avec bruit gaussien
figure;
imshow(I_gaussian);
title('Image Bruit Gaussien');

% Afficher l'image avec bruit salt & pepper
figure;
imshow(I_sp);
title('Bruit Salt & Pepper');

% Afficher l'image avec bruit gaussien filtrée par moyenneur
figure;
imshow(I_gaussian_filtered);
title('Bruit Gaussien (Filtre Moyenneur)');

% Afficher l'image avec bruit salt & pepper filtrée par moyenneur
figure;
imshow(I_sp_filtered);
title('Salt & Pepper (Filtre Moyenneur)');

% Afficher l'image avec bruit gaussien filtrée par médian
figure;
imshow(I_gaussian_median);
title('Gaussien (Filtre Médian)');

% Afficher l'image avec bruit salt & pepper filtrée par médian
figure;
imshow(I_sp_median);
title('Salt & Pepper (Filtre Médian)');
