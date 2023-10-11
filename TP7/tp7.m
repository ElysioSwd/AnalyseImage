
clear all;close all;

% Définitioon des variables
% I: image originale
% Ix: dérivée de l'image en x
% Iy: dérivée de l'image en y
% Ig: module du gradient
% Ia: image agrandie (bourrage des zeros aux bords)
% Igmax: la valeur maximale de Ig
% Igmin: la valeur minimale de Ig
% SFort: seuil fort
% SFaible: seuil faible
% Ic: image de contours de l'image originale
% Ich: image de contours de l'image oiginale par le seuil hystérésis


% Lire une image et l'afficher
I = imread('cameraman.tif');

%I = zeros(100,100);
%I(25:75,25:75) = 1;

% Filtre de Prewitt
hx = [-1 0 1; -1 0 1; -1 0 1];
hy = hx';

% Agrandir l'image avec des zéros aux bords
[NL NC] = size(I);
Ia = zeros(NL+2, NC+2);
Ia(2:NL+1, 2:NC+1) = I;

% Calcul des dérivées en x et en y
for y=2 : NL+1
    for x=2 : NC+1
        Ix(y, x) = abs(sum(sum(Ia(y-1:y+1, x-1:x+1).*hx)));
        Iy(y, x) = abs(sum(sum(Ia(y-1:y+1, x-1:x+1).*hy)));
    end
end

Ix(NL+2,:) = 0;
Ix(:,NC+2) = 0;
Iy(NL+2,:) = 0;
Iy(:,NC+2) = 0;

% Application du filtre gaussien
function Igaus = filtreGaussian(img, seuillage)
    [NL NC] = size(img);
    h = fspecial('gaussian', [3 3], seuillage);
    for y=2 : NL-1
        for x=2 : NC-1
            Igaus(y-1, x-1) = abs(sum(sum(img(y-1:y+1, x-1:x+1).*h)));
        end
    end
end
IgausX = filtreGaussian(Ix, 0.1);
IgausY = filtreGaussian(Iy, 0.1);

% Calcul de R
function R = calculDeR(Ix, Iy ,lambda)
    R = abs((Ix.*Ix).*(Iy.*Iy) - (Ix.*Iy) - lambda.*(((Ix.*Ix) + (Iy.*Iy)).*((Ix.*Ix) + (Iy.*Iy))));
end
R = calculDeR(IgausX, IgausY, 1);

% Calcul du max du module
Irmax = max(max(R));
Irmin = min(min(R));

% Calcul du seuil
seuil = 0.05*Irmax;

% Seuillage
Ipi = (R >= seuil);

% Contour
figure()
imshow(I);
figure()
imshow(Ipi);