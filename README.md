# Automated-Inspection-at-soft-drink-bottling-plant
## Development of a visual inspection system.

In this inspection system development, the following seven fault conditions were aimed to be detected
- Bottle under filled, 
- Bottle over filled, 
- Bottle has label missing, 
- Bottle has label but label printing was failed, 
- Bottle label is not straight, 
- Bottle cap is missing, and 
- Bottle is deformed in some way. 

Background studies include extracting region of interest, computing mean gray level, binarizing any chosen region of interest with a particular thresholding, computing percentage of black pixels and comparing to normal bottle values, extracting red channel, edge detection and obtaining connected components & their bounding boxes, finding largest bounding box, comparing area, height & width to the normal. Depending on the fault condition different types of step were applied. And a simple graphical user interface was also designed.

Note: This project was a part of the 'Image Processing' course (Master's first semester).
