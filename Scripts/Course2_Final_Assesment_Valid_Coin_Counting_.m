testImageIdx = randi([1,3])
testCoinImage = imread("testCoinImage"+testImageIdx+".png");
X = im2gray(testCoinImage);
X = imadjust(X);

% Find circles
[centers,radii,~] = imfindcircles(X,[25 75],'ObjectPolarity','bright','Sensitivity',0.85);
max_num_circles = Inf;
if max_num_circles < length(radii)
    centers = centers(1:max_num_circles,:);
    radii = radii(1:max_num_circles);
end
testCoinMask = circles2mask(centers,radii,size(X,1:2));

maskedImage = X;
maskedImage(~testCoinMask) = 0;
imshow(maskedImage)

res1 = edge(maskedImage, 'sobel');
radius = 12;
decomposition = 0;
se = strel('disk', radius, decomposition);
res2 = imerode(testCoinMask, se);

faceEdgeMask = res1 & res2;
imshow(faceEdgeMask)

radius = 20;
decomposition = 0;
se = strel('disk', radius, decomposition);
res3 = imdilate(faceEdgeMask, se);

validCoinMask = testCoinMask & res3;
imshow(validCoinMask)



coinSizes = struct2table(regionprops(validCoinMask, {'Area', 'Perimeter'}))


nDimes = coinSizes.Area > 4000 & coinSizes.Area < 4500;
nDimes = sum(nDimes)

nNickels = coinSizes.Area > 6000 & coinSizes.Area < 7000;
nNickels = sum(nNickels)

nQuarters = coinSizes.Area > 7100 & coinSizes.Area < 9000;
nQuarters = sum(nQuarters)

nFiftyCents = coinSizes.Area > 10000;
nFiftyCents = sum(nFiftyCents)

USD = (nDimes * 0.10) + (nNickels * 0.05) + (nQuarters * 0.25) + (nFiftyCents * 0.50)