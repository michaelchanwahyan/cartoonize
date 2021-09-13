close all
clear
clc

img = imread('input.jpg');
img_cartoon = cartoonize(img, 1);

img_f = imfilter(img,fspecial('gaussian', 30,5));
img_f_cartoon = cartoonize(img_f, 1);

figure;
subplot(1,2,1); imshow(img_cartoon);
subplot(1,2,2); imshow(img_f_cartoon);

imwrite(img_f_cartoon, 'output.jpg');
