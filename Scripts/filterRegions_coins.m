function [BW_out,properties] = filterRegions_coins(BW_in)
%filterRegions Filter BW image using auto-generated code from imageRegionAnalyzer app.

% Auto-generated by imageRegionAnalyzer app on 08-Sep-2024
%---------------------------------------------------------

BW_out = BW_in;

% Get properties.
properties = struct2table(regionprops(BW_out, {'Area', 'Perimeter'}));

X = properties.Area > 4000 & properties.Area<4500
sum(X)
