% Charger votre image
image = imread('circuit.tif');

% Convertir l'image en niveaux de gris si ce n'est pas déjà fait
if size(image, 3) == 3
    image = rgb2gray(image);
end

% Appliquer un filtre de détection des contours (par exemple, filtre de Canny)
edgeMap = edge(image, 'Canny');

% Définir les seuils haut et bas pour la détection par hystérésis
seuil_haut = 0.2;  % Ajustez ce seuil en fonction de votre image
seuil_bas = 0.1;   % Ajustez ce seuil en fonction de votre image

% Fonction pour la détection par hystérésis
function resultat = hysteresisThresholding(edgeMap, seuil_haut, seuil_bas)
    [m, n] = size(edgeMap);
    resultat = zeros(m, n);
    
    for i = 2:m-1
        for j = 2:n-1
            if edgeMap(i, j) >= seuil_haut
                resultat(i, j) = 1;
            elseif edgeMap(i, j) >= seuil_bas
                % Vérifier les pixels voisins pour une éventuelle connexion
                voisins = edgeMap(i-1:i+1, j-1:j+1);
                if max(voisins(:)) >= seuil_haut
                    resultat(i, j) = 1;
                end
            end
        end
    end
end

% Appliquer la détection par hystérésis
contours_hysteresis = hysteresisThresholding(edgeMap, seuil_haut, seuil_bas);

% Afficher l'image avec les contours détectés
imshow(contours_hysteresis);
title('Contours par hystérésis');
