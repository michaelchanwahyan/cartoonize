function img_q = imgq(img, intvlNum)

[M,N,~] = size(img); MN = M*N;

img_q = img;
img1 = img(:,:,1); img1_s = sort(img1(:));
img2 = img(:,:,2); img2_s = sort(img2(:));
img3 = img(:,:,3); img3_s = sort(img3(:));
bnd = 1 : MN / (intvlNum+1) : MN;
for bndIdx = 1:intvlNum
    lowbnd = bnd(bndIdx); uppbnd = bnd(bndIdx+1);
    bool_idx = img1 > img1_s(lowbnd) & img1 <= img1_s(uppbnd);
    img1(bool_idx) = mean(img1(bool_idx));
    bool_idx = img2 > img2_s(lowbnd) & img2 <= img2_s(uppbnd);
    img2(bool_idx) = mean(img2(bool_idx));
    bool_idx = img3 > img3_s(lowbnd) & img3 <= img3_s(uppbnd);
    img3(bool_idx) = mean(img3(bool_idx));
end
img_q(:,:,1) = img1;
img_q(:,:,2) = img2;
img_q(:,:,3) = img3;

end
