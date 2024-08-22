clc
close all
clear all

% pkg load image

% img = rgb2gray(imread("00187.jpg"));
img = im2gray(imread("00187.jpg"));

% imshow(img)

% In matlab, use imbinarize for segmentation.
BW = imbinarize(img);
% BW = im2bw(img, graythresh(img));
BW = ~BW;

% In matlab, use montage for multiple image display.
% figure();
% subplot(121);imshow(img);
% subplot(122);imshow(BW);

montage({img, BW})
nnz(BW)

maskedImg = img;
maskedImg(~BW) = 0;
imshow(maskedImg)
