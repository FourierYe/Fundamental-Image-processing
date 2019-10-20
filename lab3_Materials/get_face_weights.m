function weights_of_face = get_face_weights(im, eignfaces_blk)

[m,n,k] = size(eignfaces_blk);

weights_of_face = [];

im_reshaped = reshape(im,[m*n,1]);

for i = 1:k
    eignface_blk_reshaped = reshape(eignfaces_blk(:,:,i),[m*n,1]);
    weight = eignface_blk_reshaped'*im_reshaped /(eignface_blk_reshaped'*eignface_blk_reshaped);
    weights_of_face = [weights_of_face weight];
end

end