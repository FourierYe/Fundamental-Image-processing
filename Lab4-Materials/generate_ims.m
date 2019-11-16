function ims = generate_ims(im)

im = im2double(im);

my_dct2 = @(block_struct) dct2(block_struct);
im_dct = blkproc(im,[8 8],my_dct2);

% normalization
my_merge = @(block_struct) block_struct(1,1)/max(max(im_dct));
ims = blkproc(im_dct,[8 8],my_merge);

end