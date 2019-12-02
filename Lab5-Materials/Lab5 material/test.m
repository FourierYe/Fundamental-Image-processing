E_strel_1 = map_container('E')
E_strel_2 = get_boundary(E_strel_1)
im_test = imerode(character_im{1},E_strel_1)&imerode(~character_im{1},E_strel_2)

imshow(im_test)