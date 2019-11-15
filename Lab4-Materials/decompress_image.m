function decompressed_image = decompress_image(im_dct)
    
    decompresse8 = @(block_struct) idct2(block_struct)
    decompressed_image = blkproc(im_dct, [8 8], decompresse8)
    
end