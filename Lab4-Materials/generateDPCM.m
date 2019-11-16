function im_error = generateDPCM(im)

im = im2double(im);

% padding
im_padding = padarray(im,[1,1],'replicate');

[m,n] = size(im);

im_decoded = zeros(m,n);

[j,k] = size(im_padding);

for i=2:j-1
    for j = 2:k-1
        im_decoded(i-1,j-1) = (2*im_padding(i,j-1)+ im_padding(i-1,j-1)+...
            2*im_padding(i-1,j))/5;
    end
end

im_error = im - im_decoded;
im_error = im2uint8(im_error);

end