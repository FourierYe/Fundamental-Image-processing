clear
clc
im = imread('lenna512.bmp')
[m, n] = size(im);
sum = zeros(m,n);
for i=1:10
    
    im_wn = createimwithwn(im);
    sum = sum + im_wn;
end

im10_after = sum/10;
imshow(uint8 (im10_after));

im_wn10 = CalculatePSNR(im, uint8(im10_after))

sum = zeros(m,n);
for i=1:100
    
    im_wn = createimwithwn(im);
    sum = sum + im_wn;
end

im100_after = sum/100;
imshow(uint8 (im100_after));

im_wn100 = CalculatePSNR(im, im100_after)


sum = zeros(m,n);
for i=1:1000
    im_wn = createimwithwn(im);
    sum = sum + im_wn;
end

im1000_after = sum/1000;
imshow(uint8 (im1000_after));

im_wn1000 = CalculatePSNR(im, im1000_after)
