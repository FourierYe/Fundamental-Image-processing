clear
clc
im_low_dynamic_range = imread('lenna512_low_dynamic_range.bmp');
im = imread('lenna512.bmp');

x1_optimal = 0;
y1_optimal = 0;
x2_optimal = 1;
y2_optimal = 1;

histeq_image = histeq(im_low_dynamic_range);

psnr_max = 0;

for x1 = 0:16:254
    
    for y1 = 0:16:255
        
        for x2 = x1+1:16:254
            
            for y2 = 0:16:254
                
                reconstructed_im = MySegmentLinear(im_low_dynamic_range,x1,x2,y1,y2);
                
                psnr_current = psnr(im,uint8(reconstructed_im));
                
                if(psnr_current > psnr_max)
                    
                    psnr_max = psnr_current;
                    
                    x1_optimal = x1;
                    y1_optimal = y1;
                    
                    x2_optimal = x2;
                    y2_optimal = y2;            
                    
                    reconstructed_im_optimal = reconstructed_im;
                end
                
            end
            
        end
        
    end
    
    psnr_max
    
    x1_optimal
    y1_optimal
    
    x2_optimal
    y2_optimal
    
end
