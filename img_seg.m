clc
close all
clear all

pkg load image

img = rgb2gray(imread("00187.jpg"));
% imshow(img)

% In matlab, use imbinarize for segmentation.
BW = im2bw(img, graythresh(img));

% In matlab, use montage for multiple image display.
figure();
subplot(121);imshow(img);
subplot(122);imshow(BW);

