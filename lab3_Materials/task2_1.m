clear
clc
load('data_for_labC.mat')

im = imread('find_id.jpg')

% get the top 100 weights
eignfaces_blk_copy = eignfaces_blk(:,:,1:end-1);
    
weights_of_face = get_face_weights(im, eignfaces_blk_copy);

ids = 1:100

plot(ids,weights_of_face)

title('weights distribution of eignfaces')

grid on
hold on

% find the eignfaces which has a big weights
ids_max = find(weights_of_face>=5)

ids_max_value = weights_of_face(ids_max)

plot(ids_max, ids_max_value, 'm+')
