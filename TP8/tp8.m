clear all; close all;

% Définitioon des variables
% I: image originale
function J = binarisation(I)
    H = hist(I);
    S = randi(256);
    Stmp = -1;
    while (Stmp ~= S)
        Stmp = S;
        S1 = H(1:S) * transpose(0:S-1) / (sum(H(1:S))+1);
        S2 = H(S+1:256) * transpose(S:255) / (sum(H(S+1:256))+1);
        S = round((S1+S2)/2);
    end
    J = I > S;
end

% Définitioon des variables
% I: image originale
function J = binarisation2(I)
    H = hist(I);
    S = randi(256);
    Stmp = -1; S1 = -1; S2 = -1;
    while (Stmp ~= S)
        Stmp = S;
        S1 = H(1:S) * transpose(0:S-1) / (sum(H(1:S))+1);
        S2 = H(S+1:256) * transpose(S:255) / (sum(H(S+1:256))+1);
        S = round((S1+S2)/2);
    end
    J = uint8(I > S)*(S2-S1) + S1;
end

% Images
I1 = rgb2gray(imread('pepper.bmp'));

% Binarisation
B1 = binarisation(I1);
B2 = binarisation2(I1);

% Aff images
figure
imshow(I1), title('Image1 original')

% Aff binarisation
figure
imshow(B1), title('Image1 binarisation')
figure
imshow(B2), title('Image1 binarisation2')
