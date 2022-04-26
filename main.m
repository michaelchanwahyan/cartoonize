close all
clear
clc

img = imread('input.jpg');
intvlNum = 2;

img_f = imfilter(img,fspecial('gaussian', 15, 5));
img_f_cartoon = cartoonize(img_f, intvlNum, 'min');

figure;
subplot(1,2,1); imshow(img_f_cartoon);
% ----------------------------------- %
% real images , can stop at here
% ----------------------------------- %




% -------------------------------------------------- %
% for cartoon / CG images , can try below also
% -------------------------------------------------- %
img_e = imfilter(img,fspecial('gaussian', 3, 5));
img_e_cartoon = cartoonize(img_e, intvlNum, 'min');

Sh = [1, 0, -1; 2, 0, -2; 1, 0, -1];
Sv = Sh';
iec1_hp = imfilter(img_e_cartoon(:,:,1),Sh).^2 + imfilter(img_e_cartoon(:,:,1),Sh).^2;
iec2_hp = imfilter(img_e_cartoon(:,:,2),Sh).^2 + imfilter(img_e_cartoon(:,:,2),Sh).^2;
iec3_hp = imfilter(img_e_cartoon(:,:,3),Sh).^2 + imfilter(img_e_cartoon(:,:,3),Sh).^2;
L = (iec1_hp>0) .* (iec2_hp>0) .* (iec3_hp>0);
iec1 = uint16(.5*(double(img_e_cartoon(:,:,1)) .* L));
iec2 = uint16(.5*(double(img_e_cartoon(:,:,2)) .* L));
iec3 = uint16(.5*(double(img_e_cartoon(:,:,3)) .* L));

ifc1 = img_f_cartoon(:,:,1); ifc1(L>0) = iec1(L>0);
ifc2 = img_f_cartoon(:,:,2); ifc2(L>0) = iec2(L>0);
ifc3 = img_f_cartoon(:,:,3); ifc3(L>0) = iec3(L>0);

img_f_cartoon2(:,:,1) = ifc1;
img_f_cartoon2(:,:,2) = ifc2;
img_f_cartoon2(:,:,3) = ifc3;
subplot(1,2,2); imshow(img_f_cartoon2);

%imwrite(img_f_cartoon, 'output.jpg');
