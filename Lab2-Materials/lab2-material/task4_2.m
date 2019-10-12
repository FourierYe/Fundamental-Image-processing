mean_filter_kernal=1/9*[1 1 1; 1 1 1; 1 1 1];
im_recover_mean = uint8(conv2(im_sp, mean_filter_kernal, 'same'));
imshow(im_recover_mean);
psnr_filter_mean = CalculatePSNR(im, im_recover_mean)