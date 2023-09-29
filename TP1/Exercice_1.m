% Clean up pour retirer les anciens prog
clear all;
close all;

% Création d'une image noire de 100x100 pixels
fondNoir = zeros(100, 100);

% Création d'un carré blanc de 50x50 pixels au centre
tailleCarre = 50;
debutX = 25;  % Coordonnée x du coin supérieur gauche du carré
finX = 75;       % Coordonnée x du coin inférieur droit du carré
debutY = 25;  % Coordonnée y du coin supérieur gauche du carré
finY = 75;       % Coordonnée y du coin inférieur droit du carré

% Remplissage du carré avec des pixels blancs
fondNoir(debutY:finY, debutX:finX) = 1;

% Affichage de l'image
imshow(fondNoir);
 
 