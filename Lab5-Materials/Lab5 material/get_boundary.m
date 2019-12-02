function boundary_edge = get_boundary(im)

disk_se = strel('disk',1);

im_dialtion = imdilate(im, disk_se);

% im_erode = imerode(im, disk_se);

boundary_edge = im_dialtion - im;

end