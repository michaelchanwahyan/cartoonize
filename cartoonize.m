function img_q = cartoonize(img, intvlNum, intvlRank)
% intvlRank either be 'min', 'max', or 'mean'

img_q = img;

img1 = img(:,:,1);
img2 = img(:,:,2);
img3 = img(:,:,3);
bnd = 1 : max(img(:)) / intvlNum : max(img(:));
for bndIdx = 1:max(intvlNum-1, 1)
    lowbnd = round(bnd(bndIdx)); uppbnd = round(bnd(bndIdx+1));
    bool_idx = img1 > lowbnd & img1 <= uppbnd;
    img1(bool_idx) = intvlFunc([lowbnd, uppbnd], intvlRank);
    bool_idx = img2 > lowbnd & img2 <= uppbnd;
    img2(bool_idx) = intvlFunc([lowbnd, uppbnd], intvlRank);
    bool_idx = img3 > lowbnd & img3 <= uppbnd;
    img3(bool_idx) = intvlFunc([lowbnd, uppbnd], intvlRank);
end
img_q(:,:,1) = img1;
img_q(:,:,2) = img2;
img_q(:,:,3) = img3;

end

function returnVal = intvlFunc(signals, intvlRank)
if strcmp(intvlRank, 'min')
    returnVal = min(signals(:));
elseif strcmp(intvlRank, 'max')
    returnVal = max(signals(:));
elseif strcmp(intvlRank, 'mean')
    returnVal = mean(signals(:));
end
end