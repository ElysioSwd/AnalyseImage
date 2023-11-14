clear all;
close all;

% Paramètres à changer
I = zeros(100);

for i = 1:100
    I(i,i)=1;
end

figure(1);
imshow(I);

% Initialisation des paramètres de l'algo
% Nx = nb. cols.
% Ny = nb. rows.

[Nx, Ny] = size(I);
rho_max = sqrt((Nx-1)^2 + (Ny-1)^2);

rho = -rho_max:rho_max/100:rho_max;  % Changez le démarrage de rho pour qu'il couvre la plage complète de négatif à positif
N_rho = length(rho);

phi = 0:pi/100:pi - pi/100;
N_phi = length(phi);

Acc = zeros(N_phi, N_rho);  % Inverser l'ordre des dimensions

for x = 1:Nx
    for y = 1:Ny
        if I(y, x) % Si (I(y, x) est un contour)
            for phi_i = phi
                rho_i = x * cos(phi_i) + (Ny - y) * sin(phi_i);
                if (rho_i <= rho_max)
                    % Calcul des indices arrondis
                    rho_index = round((rho_i + rho_max) / (2 * rho_max / (N_rho - 1))) + 1;
                    phi_index = round(phi_i / (pi / (N_phi - 1))) + 1;

                    % Assurez-vous que les indices sont dans les limites
                    rho_index = min(N_rho, max(1, rho_index));
                    phi_index = min(N_phi, max(1, phi_index));

                    Acc(phi_index, rho_index) = Acc(phi_index, rho_index) + 1;
                end
            end
        end
    end
end

% Sélectionnez les paramètres (ρ, ϕ) à partir de votre matrice d'accumulation (Acc).
% Vous pouvez choisir les paramètres en fonction du maximum de la matrice d'accumulation ou de tout autre critère.

% Exemple : Trouver le maximum de la matrice d'accumulation.
[maxValue, maxIndex] = max(Acc(:));
[phi_index, rho_index] = ind2sub(size(Acc), maxIndex);

% Récupérer les valeurs de ρ et ϕ correspondantes.
rho = rho(rho_index);
phi = phi(phi_index);

% Calculez les coordonnées (x, y) pour la droite diagonale.
if abs(phi) < pi / 4
    y = 1:Ny;
    x = (rho - y * sin(phi)) / cos(phi);
else
    x = 1:Nx;
    y = (rho - x * cos(phi)) / sin(phi);
end

% Assurez-vous que les coordonnées (x, y) sont dans les limites de l'image.
valid_points = (x >= 1) & (x <= Nx) & (y >= 1) & (y <= Ny);
x = y(valid_points);
y = x(valid_points);

% Tracez la droite sur l'image originale.
figure(1);
imshow(I);
hold on;
plot(x, y, 'r', 'LineWidth', 2);
hold off;


figure(2);
imshow(Acc);  % Ajout de '[]' pour étirer la plage de valeurs dans l'affichage

