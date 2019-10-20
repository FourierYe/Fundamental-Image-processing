clear
clc
load('data_for_labC.mat')

im = imread('find_id.jpg')

weights_of_face = get_face_weights(im, eignfaces_blk);

ids = 1:101

plot(ids,weights_of_face)

axis([0 102 -20 130])

title('weights distribution of eignfaces')

grid on
hold on

ids_max = find(weights_of_face>=20)

ids_max_value = weights_of_face(ids_max)

plot(ids_max, ids_max_value, 'm+')
