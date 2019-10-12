im = imread('lenna512_low_dynamic_range.bmp')

[m,n]=size(im);
after_image = zeros(m,n);

for i=1:m
    for j=1:n
        after_image(i,j)=piecewise_enhance(im(i,j));
    end
end

figure(1)
imshow(uint8 ( after_image))
figure(3)
imhist(uint8 ( after_image))

figure(4)
imhist(im)
figure(2)
histeq(im)

% I think it is very difficult to decide a best piece-wise to enchance image.