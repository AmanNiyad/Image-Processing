clc
close all
clear all

pkg load image

imgOrg = imread("boston night.JPG");
imgg = rgb2gray(imgOrg);
img = im2double(imgg);
%img = img .^ 1/2;
img = imadjust(img, [],[],0.5);
img = imrotate(img,-1,'linear',bbox='crop');
imgAdj = im2uint8(img);
% imshow(imgg-imgAdj)
diff = abs(imgAdj- imgg);
imshow(diff, []);
