function message = checkBottle(im)
%First: we need to check if the middle bottle is there or not
%if not, no need to check for anything
%so we obtain a window that lies in the region where the middle bottle
%should be
Igray = rgb2gray(im);
ROI = Igray(1:250,135:225);

%binarize using a greyscale threshold of '150'
thresholded = imbinarize(ROI, double(150/256));

%calculate the percentage of black pixels
black = 100 * (sum(thresholded(:) == 0) / numel(thresholded(:)));

%if the percentage of 0 intensity level is < 10% then the middle bottle is
%missing
if black < 10
    message{1} = {'Middle bottle is missing'};
    message{2} = sprintf ('');
    message{3} = sprintf ('');
    message{4} = sprintf ('');
    message{5} = sprintf ('');
    message{6} = sprintf ('');
else
    %%Second: if the middle bottle is not missing we look if there are any
    %%faults
    message = LookForFaults(im);
end


