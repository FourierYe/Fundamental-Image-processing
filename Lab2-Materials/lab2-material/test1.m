clc;
clear;
close all;

% 对灰度图进行灰度线性变换
ori_img = imread('lenna512_low_dynamic_range.bmp');
im = imread('lenna512.bmp')
[oriHist,oriX] = imhist(ori_img);
histeqed = histeq(ori_img)

pt0 = [0,0];
pt1 = [100,50];
pt2 = [150,160];
pt3 = [255,200];

[width,height] = size( ori_img);
gray1 = ori_img;
for i=1:1:width
    for j = 1:1:height
        if (gray1(i,j)<pt1(1))
            gray1(i,j) = pt0(2) + (gray1(i,j)-pt0(1)) * ((pt1(2)-pt0(2))/(pt1(1)-pt0(1)));
        elseif(gray1(i,j)>=pt1(1)&&gray1(i,j)<pt2(1))
            gray1(i,j) = pt1(2) + (gray1(i,j)-pt1(1)) * ((pt2(2)-pt1(2))/(pt2(1)-pt1(1)));
        else
            gray1(i,j) = pt2(2) + (gray1(i,j)-pt2(1)) * ((pt3(2)-pt2(2))/(pt3(1)-pt2(1)));
        end
    end
end

psnr(histeqed, gray1)

[g1Hist,g1X] = imhist(gray1);
figure(1),subplot(1,2,1),imshow(ori_img),title('原图');subplot(1,2,2),imshow(gray1),title('灰度线性拉伸');
figure(2),subplot(1,2,1),stem(oriX,oriHist),title('原图直方图');subplot(1,2,2),stem(g1X,g1Hist),title('灰度线性拉伸直方图');

