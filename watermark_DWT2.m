% Code for image watermarking using DWT2 
clc; clear;close all
a=rgb2gray(imread('lena1.jpg'));
[numrows, numcols]=size(a);
%figure;imshow(a);title('original color image');
[h_LL,h_LH,h_HL,h_HH]=dwt2(a,'haar');
dec2d = [h_LL, h_LH; h_HL, h_HH];

%watermark image
b=rgb2gray(imread('p1.png'));
b = imresize(b,[numrows numcols]);
[w_LL,w_LH,w_HL,w_HH]=dwt2(b,'haar');
dec2d = [w_LL, w_LH;  w_HL, w_HH ];       

h_HH = 0.01*w_LL;

%output
rgb2=idwt2(h_LL,h_LH,h_HL,h_HH,'haar');
figure;
subplot(1,3,1)
imshow(a)
title('Original image');
subplot(1,3,2)
imshow(b)
title('Watermark image');
subplot(1,3,3)
imshow(uint8(rgb2));title('Watermarked image');
imwrite(uint8(rgb2),'Watermarked.jpg');