
im_noise = imnoise(im,'salt & pepper',0.6)

IDs = get_employees_ID_from_DB(im_noise, employees_DB,eignfaces_blk_copy)

IDs = IDs(1:5)

