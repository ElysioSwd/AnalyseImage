﻿clear all;
close all;
     
R = [0.5 0 1;
 0 1 0; 
 1 0 0.5];
G =[0.5 1 0 ;
 1 0 1;
 0 1 0.5];
B =[0.5 0 0;
 0 0 0;
 0 0 0.5];
     
I = cat(3,R,G,B)

imshow(I)