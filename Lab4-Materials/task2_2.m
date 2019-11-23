clear
clc

im = imread('lenna512.bmp');

my_dct2 = @(block_struct) dct2(block_struct);
im_dct = blkproc(im,[8 8],my_dct2);
% count = 1
psnr_list = [];
for i=1:14:99
    im_dct_qun = my_quantization(im_dct, i);
    
    image = decompress_image(im_dct_qun,i);
    image = uint8(image);
    %     figure(count);
    %     imshow(image);
    %     title(i);
    %     count = count +1;
    psnr_value = psnr(im,image);
    psnr_list = [psnr_list, psnr_value];
end