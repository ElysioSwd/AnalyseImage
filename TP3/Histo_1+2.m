clear all;
close all;

% Charger l'image d'entrée (par exemple, remplacez 'votre_image.jpg' par le chemin de votre image)
image = imread('img1.png');

% Assurez-vous que l'image est en niveaux de gris (convertissez-la si nécessaire)
if size(image, 3) == 3
    image = rgb2gray(image);
end

% Initialiser un vecteur d'histogramme de 256 éléments avec des zéros
histogramme = zeros(1, 256);

% Calculer l'histogramme des niveaux de gris de l'image
[NL, NC] = size(image);
for y = 1:NL
    for x = 1:NC
        intensite = image(y, x);
        histogramme(intensite + 1) = histogramme(intensite + 1) + 1; % Incrémente l'histogramme
    end
end

% Afficher l'histogramme
bar(histogramme);
xlabel('Niveaux de gris');
ylabel('Fréquence');
title('Histogramme des niveaux de gris');
