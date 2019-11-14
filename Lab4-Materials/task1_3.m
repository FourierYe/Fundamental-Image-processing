image=imread('lenna512.bmp')
% if we don't multiply 16 again, the image will be dark
image_8=(image./16+1)*16-1;

entropy16 = my_entropy(image_8)

partion = 256/16-1 : 16:255

image_reshaped = reshape(image,[1,512*512]);
image_reshaped = quantiz(image_reshaped, partion);

image_original = reshape(image_reshaped,[512,512]);

image_original = uint8(image_original);
entropyQun = my_entropy(image_original)
