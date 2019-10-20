function im = generate_face_from_weights(weights_of_face, eignfaces_blk)

    [m,n,k] = size(eignfaces_blk);
    
    sum = zeros(m,n);
    
    for i = 1:k
       sum = sum + eignfaces_blk(:,:,i)*weights_of_face(i); 
    end

    im = uint8(sum);
end


% I think it isn't enough to just use 100 basis to describe 450*350 pixels, because if we want
% to describe R^n vector space, we must use n basis which is independent to generate whole vector 
% space. The 100 basis just can generate a subspace.