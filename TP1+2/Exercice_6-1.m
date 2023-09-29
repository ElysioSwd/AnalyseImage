clear all;
close all;
     
r = [1 0 0 1;
 0 1 0 0];
g=[0 1 0 0;
 1 0 1 0];
b=[0 0 1 0;
 0 0 0 1];
     
I = cat(3,r,g,b)

imshow(I)
