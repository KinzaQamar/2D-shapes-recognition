/////////////////////////////////////////////////////////////////////////////////////////////////////////
// Author Name: 	Kinza Qamar Zaman																																		 //
// Create Date:    							                                                                       //
// Project Name:  2D geometric shape recognition                            	                         //
// Language:                                                                       										 //
//                                                                                                     //
// Description:                                                                                        //
//            																																				 		             //
// Revision Date:  							                                                                       //
/////////////////////////////////////////////////////////////////////////////////////////////////////////

clc;clear;close all;

//Read the image
im = imread('/home/$USER/picture.ext');

//show the image
imshow(im);
title('Original Image');

//Convert into gray scale.
imgray = rgb2gray(im);

//show the gray scaled image
figure;
imshow(imgray);
title('Gray scale Image');

//Convert the gray scale image into binary image
imbw = imbinarize(imgray);
figure;imshow(imbw);
title('Binary Image');

imedge=edge(imgray,'canny');
figure ;imshow(imedge);
title('Egde Detection of original Image');

imfill = imfill(imedge,'holes');
figure;imshow(imfill);
title('Filled image');

[L,N] = bwlabel(imfill)
area = regionprops(L,'area')
%imareafilt = bwareaopen(imfill,500);
%figure;imshow(imareafilt);
%title('Filtered area');
boundingbox = regionprops(L,'boundingbox')
hold on
for k = 1:length(boundingbox)
    bboxes = boundingbox(k).BoundingBox;
    rect = rectangle('position',[bboxes(1),bboxes(2),bboxes(3),bboxes(4)],'Edgecolor','y','linewidth',8)
    title('Bounding Boxes');
end
hold off
for k = 1:N
    bboxesarea(k)=(boundingbox(k).BoundingBox(3))*(boundingbox(k).BoundingBox(4));
end
for k = 1:N
    extend(k) = ((area(k).Area))/(bboxesarea(k));
end
for k = 1:N
    if (boundingbox(k).BoundingBox(3) == boundingbox(k).BoundingBox(4))
        if (extend(k) > 0.7 && extend(k) < 0.99)
        text(boundingbox(k).BoundingBox(1),boundingbox(k).BoundingBox(2),'circle');
        else
        text(boundingbox(k).BoundingBox(1),boundingbox(k).BoundingBox(2),'square');
        end
    else
        if (extend(k)> 0.25 && extend(k) < 0.6)
        text(boundingbox(k).BoundingBox(1),boundingbox(k).BoundingBox(2),'triangle');
        else
        text(boundingbox(k).BoundingBox(1),boundingbox(k).BoundingBox(2),'Rectangle')
        end
    end
end