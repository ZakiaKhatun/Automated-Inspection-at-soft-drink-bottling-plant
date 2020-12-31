function O = isdeformed(I)
%First we need to know the range of pixles that label area lies in for normal bottles
%so we can define a range for the area, width and height of that region
    %In = imread('normal-image001.jpg');
    %InR = In(:, :, 1); % extract the red channel
    %InR = imadjust(InR); % apply contrast adjustment
    %figure,imshow(InR);
    %[xi,yi] = getline;%we started from lower left corner of the middle bottle lable area
    %we got the following values:
    %xi = [115.0000; 239.0000; 240.0000; 113.0000; 114.0000]
    %yi = [275; 275; 180; 180; 275]
    %width: x2-x2=124 ; x3-x4=127 -->so we estimate the range of width as (110-130)
    %height: y2-y3=95; -->so we estimate the range of height as (80-100)
    %estimated range of the area is (9800,12000)
    
%Second we need to know the ROI
%from prev. obtained values and by expanding the width to the left and right of the middle bottle lable area
%we define the ROI range as I(190:280, 100:260);
%so we will not repeat the prev. steps and just use the obtained ranges in the following vodes
    
    
%Third Process the input image to check if it has deformation of the input image 
    %1)extract the red channel
    Ired = I(:, :, 1); 
    %2)apply contrast adjustment
    Ired = imadjust(Ired); 
    %3) Impose the ROI 
    ROI = Ired(190:280, 100:260);
    %4) Thresholding the red channel using a greyscale threshold of '200'
    binaryRoI = imbinarize(ROI, double(200/256));
    %5) obtaining the connected components and bounding boxes around them
    cc = bwconncomp(binaryRoI, 4);
    values = regionprops(cc, 'BoundingBox');  
    %6) check the area and width of all bounding boxes we found to get the largest area and width
    Area_max = 0; Width_max = 0;
    for i = 1 : length(values)
        bounbox = values(i).BoundingBox;
        bounbox_Area = bounbox(3)*bounbox(4);
        % look for the bounding box with the largest area
        if bounbox_Area > Area_max
            Area_max = bounbox_Area;
            Width_max = bounbox(3);
            Height_max = bounbox(4);
        end
    end
    %7) checking that the area, width and height are within the pre-defined ranges
    checkArea = (Area_max >= 9800) && (Area_max <= 12000);
    checkWidth = (Width_max >= 110) && (Width_max <= 130);
    checkHeight = (Height_max >= 80) && (Height_max <= 100);
    
    if (checkArea && checkWidth && checkHeight)
        O = 0; %if all are true then no deformation
    else O = 1; %if all are not true then there is deformation
       
end