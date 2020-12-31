function O = isCapMissed(I)
%First we need to extract the region in which the bottle cap lies in (ROI)
%In = imread('normal-image001.jpg');
%In = rgb2gray(In);
%figure, imshow(In);
%[xi,yi] = getline;
%we obtain the following range as our ROI: I(5:45, 150:200)

I = rgb2gray(I);
ROI = I(5:45, 150:200);

% threshholding using a greyscale threshold of '150'
thresholded = imbinarize(ROI, double(150/256));

% check the percentage of black pixels in the binary image
black = 100 * (sum(thresholded(:) == 0) / numel(thresholded(:)));

if black < 25
    O = 1; %if the percentage of black pixels is <25% then the cap is missing
else O = 0; %if not, the cap is not missing
end