﻿clear all;
close all;

% Charger l'image
image = imread('chat.png'); % Remplacez 'votre_image.jpg' par le chemin de votre image

% Convertir l'image en niveaux de gris si ce n'est pas déjà fait
if size(image, 3) == 3
    image = rgb2gray(image);
end

% Appliquer les filtres de Prewitt
filter_x = [-1 0 1; -1 0 1; -1 0 1]; % Filtre de Prewitt horizontal
filter_y = [-1 -1 -1; 0 0 0; 1 1 1]; % Filtre de Prewitt vertical

G_x = conv2(double(image), filter_x, 'same');
G_y = conv2(double(image), filter_y, 'same');

% Calculer le gradient total
gradient = sqrt(G_x.^2 + G_y.^2);

% Normaliser les valeurs du gradient pour les rendre visibles
gradient = (gradient - min(gradient(:))) / (max(gradient(:)) - min(gradient(:))) * 255;

% Définir un seuil pour la détection des contours
seuil = 50; % Vous pouvez ajuster ce seuil en fonction de vos besoins

% Appliquer le seuil pour détecter les contours
contours = gradient > seuil;

% Afficher l'image des contours
imshow(contours);
title('Contours détectés avec Prewitt');