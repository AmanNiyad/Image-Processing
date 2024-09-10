coinImage = imread("coinImage.png"); 
% Adjust data to span data range.
X = im2gray(coinImage); 
X = imadjust(X);

% Find circles
[centers,radii,~] = imfindcircles(X,[25 75],'ObjectPolarity','bright','Sensitivity',0.85);
max_num_circles = Inf;
if max_num_circles < length(radii)
    centers = centers(1:max_num_circles,:);
    radii = radii(1:max_num_circles);
end
coinMask = circles2mask(centers,radii,size(X,1:2));

maskedCoinImage = X;
maskedCoinImage(~coinMask) = 0;

coinSizes = struct2table(regionprops(coinMask, {'Area', 'Perimeter'}))


nDimes = coinSizes.Area > 4000 & coinSizes.Area < 4500;
nDimes = sum(nDimes)

nNickels = coinSizes.Area > 6000 & coinSizes.Area < 7000;
nNickels = sum(nNickels)

nQuarters = coinSizes.Area > 7100 & coinSizes.Area < 9000;
nQuarters = sum(nQuarters)

nFiftyCents = coinSizes.Area > 10000;
nFiftyCents = sum(nFiftyCents)

USD = (nDimes * 0.10) + (nNickels * 0.05) + (nQuarters * 0.25) + (nFiftyCents * 0.50)