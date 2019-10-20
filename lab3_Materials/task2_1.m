sum = zeros(450,300)

for i = 1:101
    sum = sum + eignfaces_blk(:,:,i)*weights_of_face(i);
end

imshow(uint8(sum))
