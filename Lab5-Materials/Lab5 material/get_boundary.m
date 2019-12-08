function boundary_edge = get_boundary(im)

disk_se = strel('disk',1);

im_dialtion = imdilate(im, disk_se);

% we can use subtraction to get the same result
boundary_edge = xor(im_dialtion,im);

end