function results = crackAnalysis(img)

gs = im2gray(img);
gsf = imgaussfilt(gs, 1);

BW = imbinarize(gsf);

BW = imcomplement(BW);

% Fill holes
BW = imfill(BW, 'holes');

% Invert mask
BW = imcomplement(BW);

% Fill holes
BW = imfill(BW, 'holes');

% Invert mask
BW = imcomplement(BW);


rp = regionprops("table", BW, "Area");
distToEdge = bwdist(~BW);
maxWidth =2* max(distToEdge, [], "all");

results.bw = BW;
results.NumRegions = height(rp);
results.area = sum(rp.Area);
results.MaxWidth = maxWidth;

end