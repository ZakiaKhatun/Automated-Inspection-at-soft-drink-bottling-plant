function message = LookForFaults(I)
flag1 = 0; %indicating no label
flag2 = 0; %indicating no label print
flag3 = 0; %indicating label not straight

%Step 1: Checking the filling level
%we first obtain a ROI and find the mean gray level of it
Igray = rgb2gray(I);
ROI = Igray(100:200,100:200);
meanGrayLevel = mean2(ROI);  %Finding graylevel in range between 100 & 200
x = meanGrayLevel;
if x >= 70 && x <= 100
    message{1} = sprintf ('Middle bottle is overfilled');
elseif x >= 150 && x <= 200
    message{1} = sprintf ('Middle bottle is underfilled');
else
    message{1} = sprintf ('');
end

%Step 2: checking if the label is missing  or if there is no label print
% Extract the ROI for the label
ROI1 = Igray(180:280,110:240);
%1) to check if label is missing
% binarize using a greyscale threshold of '50'
thresholded = imbinarize(ROI1, double(50/256));
% Calculate the percentage of black pixels
black = 100 * (sum(thresholded(:) == 0) / numel(thresholded(:)));
% if percentage of black pixels is > 50% then there is no label
if black > 50
    message{2} = sprintf ('Middle bottle has no label'); flag1 = 1;
else
    message{2} = sprintf ('');
end
%2) to check if label print is missing
% binarize using a greyscale threshold of '150'
thresholded2 = imbinarize(ROI1, double(150/256));
% Calculate the percentage of black pixels
black2 = 100 * (sum(thresholded2(:) == 0) / numel(thresholded2(:)));
% if percentage of black pixels is < 50% then there is no print
if black2 < 50
    message{3} = sprintf ('Middle bottle has no label print'); flag2 = 1;
else
    message{3} = sprintf ('');
end


%Step 3: Checking if the label is straight (only for bottles with labels)
if flag1==0 && isLabelStraight(I) == 0 %which means there is label
    message{4} = sprintf ('Middle bottle label is not straight'); flag3 = 1;
else
    message{4} = sprintf('');
end

%Step 4: Checking if the cap is missing
if isCapMissed(I)==1
    message{5} = sprintf ('Middle bottle cap is missing');
else
    message{5} = sprintf ('');
end


%Step 5: Checking if the bottle is deformed (only for bottles with labels)&(the label should be straight
%otherwise, according to the method we followed it will give a result of deformed bottle
%in the case of no label bottles and some cases of not straight labels
if flag1==0 && flag3==0 && isdeformed(I)==1
    message{6} = sprintf ('Middle bottle is deformed');
else
    message{6} = sprintf ('');
end

end