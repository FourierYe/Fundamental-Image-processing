function reconstructed_image = reconstruct_image(im, x1, x2, k1 ,k2 ,k3)

[m, n] = size(im);

reconstructed_image=zeros(m,n);
% 
% im = im2double(im);
% 
% logical_I = ones(m,n);
% 
% im_logical_x1 = im < x1;
% im_logical_x1r = logical_I - im_logical_x1;
% 
% im_logical_x1_x2 = (im > x1 ).*(im<x2);
% im_logical_x1_x2r = logical_I - im_logical_x1_x2;
% 
% im_logical_x3_max = im >x2;
% im_logical_x3_maxr = logical_I - im_logical_x1;
% 
% reconstructed_image = im .* (im_logical_x1 .*k1 + im_logical_x1r + im_logical_x1_x2.*k2+im_logical_x1_x2r + im_logical_x3_max.*k3 +im_logical_x3_maxr);
% 
% reconstructed_image = im2uint8(reconstructed_image);

% 
for i = 1:m

    for j = 1:n
        if(im(i,j)>=0&& im(i,j)<=x1)
            reconstructed_image(i,j)=im(i,j)*k1;
        end
        if(im(i,j)>x1&&im(i,j)<=x2)
            reconstructed_image(i,j)=im(i,j)*k2;
        end
        if(im(i,j)>x2 && im(i,j)<=255)
            reconstructed_image(i,j)=im(i,j)*k3;
        end
    end

end


end