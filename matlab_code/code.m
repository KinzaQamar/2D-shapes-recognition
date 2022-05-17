clc;clear;close all;

//Read the image
im = imread('C:\Users\Dell\Downloads\2dshapes.png');

//show the image
imshow(im);
title('Original Image');

//Convert into gray scale.
imgray = rgb2gray(im);

figure;imshow(imgray);
title('Gray scale Image');