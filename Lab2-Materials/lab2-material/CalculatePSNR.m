% calculate the PSNR of gray image , 2 dimension matrix
function PSNR = CalculatePSNR(image_1, image_2)
    [m, n] = size(image_1);
    N = m * n;
    image_1 = double(image_1);
    image_2 = double(image_2);
    mse = sum( sum( (image_1-image_2).^2) )/N;
    PSNR=10 * log10( 255^2 / mse);
end