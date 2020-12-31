function O = isLabelStraight(I)
I = rgb2gray(I);
I = imadjust(I);
%First we need to Extract the region for the top of the bottle label (ROI)
%figure, imshow(I);
%[xi,yi] = getline;
%we obtain the following range as our ROI: I(170:195, 110:250)
ROI1 = I(170:195, 110:250);

% apply edge detection on the ROI
[~, s] = edge(ROI1, 'Sobel');
ROI2 = edge(ROI1, s*0.75);

% get the connected components
cc = bwconncomp(ROI2);
values = regionprops(cc, 'BoundingBox');
width_max = 0; height_max = 0;

% check for all bounding boxes and fint their max. width and max. height
for i = 1 : length(values)
    bounbox = values(i).BoundingBox;
    
    if bounbox(3) > width_max
        width_max = bounbox(3);
    end
    
    if bounbox(4) > height_max
        height_max = bounbox(4);
    end
end

% Extract the ROI for the top half of the label
ROI3 = I(180:230, 110:250);

% thresholding using a greyscale threshold of '50'
thresholded3 = imbinarize(ROI3, double(50/256));

% Calculate the percentage of black pixels
black = 100 * (sum(thresholded3(:) == 0) / numel(thresholded3(:)));

%Check if the white horizontal line at the top of the label is within limits
cond1 = width_max <= 100 || height_max >= 10;

%Check the percentage of black pixels on the label
cond2 = black >= 13;

if cond1 && cond2
    O = 0;%if both conditions are true then the lable is not straight
else O = 1;%otherwize, the label is straight
end