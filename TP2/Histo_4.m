% Charger l'image d'entrée couleur (remplacez 'perroquet_couleur.png' par le chemin de votre image)
image_couleur = imread('Kaido streamer.png');

% Assurez-vous que l'image est au format RGB
if size(image_couleur, 3) ~= 3
    error('L''image doit être en format RGB.');
end

% Divisez l'image en canaux de couleur (rouge, vert et bleu)
canal_rouge = image_couleur(:, :, 1);
canal_vert = image_couleur(:, :, 2);
canal_bleu = image_couleur(:, :, 3);

% Calculez les histogrammes pour chaque canal de couleur
histogramme_rouge = hist(canal_rouge(:), 0:255);
histogramme_vert = hist(canal_vert(:), 0:255);
histogramme_bleu = hist(canal_bleu(:), 0:255);

% Créez une grille pour les niveaux de gris
niveaux_de_gris = 0:255;

% Affichez les histogrammes des canaux de couleur en 2D empilés
figure;

subplot(3, 1, 1);
bar(niveaux_de_gris, histogramme_rouge, 'r');
title('Histogramme 2D du Canal Rouge');
xlabel('Niveaux de gris');
ylabel('Fréquence');

subplot(3, 1, 2);
bar(niveaux_de_gris, histogramme_vert, 'g');
title('Histogramme 2D du Canal Vert');
xlabel('Niveaux de gris');
ylabel('Fréquence');

subplot(3, 1, 3);
bar(niveaux_de_gris, histogramme_bleu, 'b');
title('Histogramme 2D du Canal Bleu');
xlabel('Niveaux de gris');
ylabel('Fréquence');
