function im = generate_face_from_weights(weights_of_face, eignfaces_blk)

    [m,n,k] = size(eignfaces_blk);
    
    sum = zeros(m,n);
    
    for i = 1:k
       sum = sum + eignfaces_blk(:,:,i)*weights_of_face(i); 
    end

    im = uint8(sum);
end