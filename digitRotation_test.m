%----------------------------------------------------------------
% File:     digitRotation_test.m
%----------------------------------------------------------------
%
% Author:   Marek Rychlik (rychlik@arizona.edu)
% Date:     Wed May  3 17:21:16 2023
% Copying:  (C) Marek Rychlik, 2020. All rights reserved.
% 
%----------------------------------------------------------------
% Testing image rotation
% Shows no artifacts, good job!

I = imread('peppers.png');
I = double(I(:,:,2))./255;                   % Green plane
J = digitRotation(I,80);
imshowpair(I,J,'montage');
