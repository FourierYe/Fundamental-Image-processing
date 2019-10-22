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
                
                k1 = (y1+1)/(x1+1);
                interval1_left=0;
                interval1_right=x1;
                
                k2 = (y2-y1)/(x2-x1);
                interval2_left = x1;
                interval2_right = x2;
                
                k3 = (256-y2)/(255-x2);
                interval3_left = x2;
                interval3_right = 255;
                
                reconstructed_im = reconstruct_image(im_low_dynamic_range, x1,x2,k1,k2,k3);
                
                psnr_current = CalculatePSNR(im,reconstructed_im);
                
                if(psnr_current > psnr_max)
                    
                    psnr_max = psnr_current;
                    
                    x1_optimal = x1;
                    y1_optimal = y1;
                    
                    x2_optimal = x2;
                    y2_optimal = y2;
                    
                   
                    k1_optimal = k1;
                    k2_optimal = k2;
                    k3_optimal = k3;
                    
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
    
    k1_optimal
    k2_optimal
    k3_optimal
    
end
