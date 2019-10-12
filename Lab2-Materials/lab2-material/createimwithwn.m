function im_wn = createimwithwn(im)
 [m, n] = size(im);
 im_wn = zeros(m, n);
 for i=1:1:m
     for j=1:1:n
%          generate gaussian point
     generate_point = 256 * generate_gaussian_noise();
     im_wn(i, j) = im(i, j) + generate_point;
     end
 end
 
end