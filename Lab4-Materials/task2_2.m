clear
clc

im = imread('lenna512.bmp');

my_dct2 = @(block_struct) dct2(block_struct);
im_dct = blkproc(im,[8 8],my_dct2);

im_dct_qun = my_quantization(im_dct, 1);
% im_dct_qun = uint8(im_dct_qun);

image = decompress_image(im_dct_qun);
image = uint8(image);
imshow(image);
psnr(im,image)