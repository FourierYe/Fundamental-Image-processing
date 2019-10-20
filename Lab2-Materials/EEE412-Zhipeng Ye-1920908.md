# 	Lab 2 - Image Processing EEE412

#### Author: Zhipeng Ye    

#### Student ID: 1920908

#### Faculty: MSc Multimedia Telecommunications  

#### Data: 11th October 2019



### 1. Task 1 (**50’**): 

#### Download from ICE the file lab2-material.rar which includes:

#### A monochrome image lenna512.bmp (load it into Matlab as im) which will be used as reference. 

##### Code

```matlab
im=imread('lenna512.bmp');
```

##### Result

![image-20191016220844899](/Users/geekye/Documents/Courses/image processing/lab/Lab2-Materials/lab2-report/image-20191016220844899.png)

##### Analyze

The image is loaded as a reference. Next steps are relaid on this step.

#### Add Gaussian white noise with zero mean and variance 10 to the image *im* and display the noisy image. Name it as im_wn. Please write one function to generate this image instead of calling matlab function directly. (**10’**) 

##### Code

```matlab
%  clear
%  clc
 im = imread('lenna512.bmp');
 im = im2double(im);
 [m, n] = size(im);
 im_wn = zeros(m, n);
 for i=1:1:m
     for j=1:1:n
%          generate gaussian point
     generate_point = generate_gaussian_noise();
     im_wn(i, j) = im(i, j) + generate_point;
     end
 end
 
 imshow(im_wn)
```

```matlab
function gaussian_noise_point = generate_gaussian_noise()
    gaussian_x = 100*rand();
    gaussian_noise_point = gaussian_function(gaussian_x);
    if rand()<0.5
        gaussian_noise_point = - gaussian_noise_point;
    end
end
```

```matlab
function gaussian_point = gaussian_function(x)
%     generate gaussian points
    variance = 10;
    standard_diff = sqrt(variance);
    
    gaussian_point = 1/(sqrt(2*pi)*standard_diff) * exp(-x^2/(2*variance));
end
```

##### Result

![image-20191016222255779](/Users/geekye/Documents/Courses/image processing/lab/Lab2-Materials/lab2-report/task_2.png)

##### Analyze

This question ask use to generate the gaussian noise, so I make a gaussian function with zero mean and variance 10. Besides, I choose $[0\ \   100]$  interval to sampling points. Finally, I use these function to affect the original picture.

#### Add salt & pepper noise with noise density 10% to the image *im* and display the noisy image. Name it as im_SP. Please write one function to generate this image instead of calling matlab function directly. (**10’**) 

##### Code

```matlab
clear
clc
im = imread('lenna512.bmp');
im_SP = generate_saltpepper(im, 0.1);
imshow(im_SP);
```

```matlab
function imagewithSP = generate_saltpepper(image, SNR)
    if(SNR>1 || SNR<0)
        imagewithSP = [];
        return;
    end

    [m, n] = size(image);
    
    loop = m * n * SNR;
    
    for i=1:loop
        x = floor(rand()*m);
        y = floor(rand()*n);
        if(rand<=0.5)
            value = 0; 
        else
            value = 255;
        end
        image(x+1,y+1)=value;
    end
    imagewithSP = image;
end
```

##### Result

![image-20191016223301059](/Users/geekye/Documents/Courses/image processing/lab/Lab2-Materials/lab2-report/task1_3.png)

##### Analyze

Firstly, noise density 10% means that the noise points occupy 10% of original pixels. Secondly,  salt & pepper noise is a kind of random noise, so I sampling from original pictures randomly. Finally, we can find there are some difference between salt & pepper noise and gaussian noise.

#### Evaluate the PSNR of the previous images with respect to the reference image im and complete the following table, where the image im_low_dynamic_range is loaded from lenna512_low_dynamic_range.bmp in lab2-material.zip. You can use PSNR from you Lab 1. (**5’**) 

##### Code

```matlab
clear
clc
im = imread('lenna512.bmp');
im_SP = generate_saltpepper(im, 0.1);
PSNR_SP = CalculatePSNR(im, im_SP)

 im = im2double(im);
 [m, n] = size(im);
 im_wn =createimwithwn(im);
 PSNR_WN = CalculatePSNR(im, im_wn)
 
 im_low = imread('lenna512_low_dynamic_range.bmp');
 PSNR_low = CalculatePSNR(im, im_low)
```

```matlab
% calculate the PSNR of gray image , 2 dimension matrix
function PSNR = CalculatePSNR(image_1, image_2)
    [m, n] = size(image_1);
    N = m * n;
    image_1 = double(image_1);
    image_2 = double(image_2);
    mse = sum( sum( (image_1-image_2).^2) )/N;
    PSNR=10 * log10( 255^2 / mse);
end
```

##### Result 

|   Image   |  im_wn  |  im_SP  | im_low_dynamic_range |
| :-------: | :-----: | :-----: | :------------------: |
| PSNR (dB) | 33.3999 | 15.6806 |        5.9657        |

##### Analyze

According to PSNR, The quality of im_wn is best, the quality of im_SP is worse that im_wn, the quality of im_low_dynamic_range is worst.

#### Check the histogram of all the previous images, compare them with the histogram of the reference image, comments and **briefly** explain your finding. (**10’**) 

##### Code

 ```matlab
subplot(2,2,1)
imhist(im2uint8(im))
subplot(2,2,2)
imhist(im2uint8(im_wn))
% equalization
subplot(2,2,3)
imhist(im_SP)
% add some points in 0 and 255
subplot(2,2,4)
imhist(im_low)
% points concentrate on the interval
 ```

##### Result

![image-20191016225909723](/Users/geekye/Documents/Courses/image processing/lab/Lab2-Materials/lab2-report/task1_5.png)

##### Analyze

The function of white gaussian noises make histogram equalization in some degree. The salt & pepper noises make some points equal to 0 or 255.

The pixels of low_dynamic_range picture concentrate on the interval.  

#### Try to use the technique of *Image Averaging* to remove the noise of sub-task ii, e.g., average 10 images to get *im_wn10*, average 100 images to get *im_wn100*, and average 1000 images to get *im_wn1000*. Evaluate the PSNR of these three images with respect to the reference image im. Comments and briefly explain this result. **(15’)** 

##### Code

```matlab
clear
clc
im = imread('lenna512.bmp')
[m, n] = size(im);
sum = zeros(m,n);
for i=1:10
    
    im_wn = createimwithwn(im);
    sum = sum + im_wn;
end

im10_after = sum/10;
imshow(uint8 (im10_after));

im_wn10 = CalculatePSNR(im, uint8(im10_after))

sum = zeros(m,n);
for i=1:100
    
    im_wn = createimwithwn(im);
    sum = sum + im_wn;
end

im100_after = sum/100;
imshow(uint8 (im100_after));

im_wn100 = CalculatePSNR(im, im100_after)


sum = zeros(m,n);
for i=1:1000
    im_wn = createimwithwn(im);
    sum = sum + im_wn;
end

im1000_after = sum/1000;
imshow(uint8 (im1000_after));

im_wn1000 = CalculatePSNR(im, im1000_after)
```

##### Result

|  Image   | Im_wn10 | Im_wn100 | Im_wn100 |
| :------: | ------- | -------- | -------- |
| PSNR(dB) | 43.4434 | 53.4851  | 63.4973  |

##### Analyze

We can see from the result, the PSNR becomes larger with the increase of iterations, because of this formula.
$$
\begin{equation}
\begin{split}
&g(x) = f(x) + N(0,\sigma ^2)\\
&\sum_i^{\infty} g_i(x)=\sum_i^{\infty}f_i(x) +N(0,\sigma^2)\\
&g(x) = f(x)+\frac{1}{\infty} N(0,\sigma^2)
\end{split}
\end{equation}
$$

### Task 2 (**20’**): 

#### Write a function to generate a piece-wise linear mapping transform to enhance the contrast of im_low_dynamic_range, verify the effectiveness of several mapping transform functions by evaluating the PSNR with respect to the reference image, and show all enhanced images. Include also in your report the best intensity mapping function you obtained. 

##### Code