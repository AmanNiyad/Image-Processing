function [BW,maskedImage] = segmentCrackImageV1(X)
%segmentImage Segment image using auto-generated code from Image Segmenter app
%  [BW,MASKEDIMAGE] = segmentImage(X) segments image X using auto-generated
%  code from the Image Segmenter app. The final segmentation is returned in
%  BW, and a masked image is returned in MASKEDIMAGE.

% Auto-generated by imageSegmenter app on 10-Sep-2024
%----------------------------------------------------


% Adjust data to span data range.
X = im2gray(X)
X = imadjust(X);

% Threshold image with global threshold
BW = imbinarize(X);

% Invert mask
BW = imcomplement(BW);

% Fill holes
BW = imfill(BW, 'holes');

% Create masked image.
maskedImage = X;
maskedImage(~BW) = 0;
end

