im_low = imread('lenna512_low_dynamic_range.bmp');

x1 = 0;
y1 = 0;
x2 = 1;
y2 = 1;
x3 = 256;
y3 = 256;

histeq_image = histeq(im_low);

psnr_max = 0;

for x1 = 0:254
    
    for y1 = 0:255
        
        for x2 = x1+1:254
            
            for y2 = 0:254
                
                k1 = y1/x1;
                interval1_left=0;
                interval1_right=x1;
                
                k2 = (y2-y1)/(x2-x1);
                interval2_left = x1;
                interval2_right = x2;
                
                k3 = (256-y2)/(255-x2);
                interval3_left = x2;
                interval3_right = 255;
                
                reconstructed_im = reconstruct_image(im_low, x1,x2,k1,k2,k3);
                
                psnr_current = CalculatePSNR(histeq_image,reconstructed_im);
                
                if(psnr_current > psnr_max)
                    psnr_max = psnr_current;
                end
                
            end
            
        end
        
    end
    
    psnr_max
    
    x1
    y1
    
    x2
    y2
    
    x3
    y3
    
    k1
    k2
    k3
    
end
