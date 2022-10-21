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