image = imread('lenna512color.bmp');

% I found a library to convert rgb into gray space.
Image_gray= rgb2gray(image);
imshow(Image_gray)

% Here is a implement without library following by this formula
% Gray = R*0.299 + G*0.587 + B*0.114

R=image(:,:,1);
G=image(:,:,2);
B=image(:,:,3);
Gray = R*0.299 + G*0.587 + B*0.114;

imshow(Gray);