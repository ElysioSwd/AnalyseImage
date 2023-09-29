clear all;
close all;

A = [ 1 2 3 ;
      2 3 2 ;
      3 2 1 ];

%    R G B
B = [0.2 0.2 0.2;
     0 1 0;
     1 0 0];

imshow(A, B);

%Les coins sont en gris très foncé, car nous avons changé la couleur de l'index 1