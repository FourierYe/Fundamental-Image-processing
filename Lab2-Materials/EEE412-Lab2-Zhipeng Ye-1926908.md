

# 	Lab 2 - Image Processing EEE412

#### Author: Zhipeng Ye    

#### Student ID: 1926908

#### Faculty: MSc Multimedia Telecommunications  

#### Data: 11th October 2019



### 1. Task 1 (**50’**): 

#### Download from ICE the file lab2-material.rar which includes:

#### A monochrome image lenna512.bmp (load it into Matlab as im) which will be used as reference. 

##### Code

```matlab
im=imread('lenna512.bmp');
```

##### Analyze

The image is loaded as a reference. The next steps are relaid on this step.

#### Add Gaussian white noise with zero mean and variance 10 to the image *im* and display the noisy image. Name it as im_wn. Please write one function to generate this image instead of calling matlab function directly. (**10’**) 

##### Code

```matlab
clear
clc
im = imread('lenna512.bmp');
[m, n] = size(im);

variance = 10;
sigma = sqrt(variance);
mu = 0;

im_wn = guassian_noise(im, mu, sigma)

imshow(im_wn)
title('guassian points')

psnr = psnr(im,im_wn)
```

```matlab
function im_wn = guassian_noise(im, mu, sigma)

    [m,n] = size (im)
    
    guassian_points = mu + sigma * randn(m,n)
    
    im_wn = double(im) + guassian_points
    
    im_wn = uint8(im_wn)
    
end
```

##### Result

![image-20191024214110144](/Users/geekye/Documents/Courses/image processing/lab/Lab2-Materials/lab2-report/task1_2.png)

##### Analyze

This question asks use to generate the Gaussian noise, so I use randn to generate the $N(0,1)$ distribution funtion. and mulitiply standard deviation $\sqrt{10}$, and plus mean $0$.

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

% check parameters
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

Firstly, the noise density of 10% means that the noise points occupy 10% of the original pixels. Secondly, salt & pepper noise is a kind of random noise, so I sampling from original pictures randomly. Finally, we can find there is some difference between salt & pepper noise and gaussian noise. In this experiment, the quality of im_SP is worse than im_wn.

#### Evaluate the PSNR of the previous images with respect to the reference image im and complete the following table, where the image im_low_dynamic_range is loaded from lenna512_low_dynamic_range.bmp in lab2-material.zip. You can use PSNR from you Lab 1. (**5’**) 

##### Code

```matlab
clear
clc

im = imread('lenna512.bmp');
im_SP = generate_saltpepper(im, 0.1);
PSNR_SP = psnr(im, im_SP)

im_wn =guassian_noise(im,0,sqrt(10));
PSNR_WN = psnr(im, im_wn)

im_low = imread('lenna512_low_dynamic_range.bmp');
PSNR_low = psnr(im, im_low)
```

##### Result 

|   Image   |  im_wn  |  im_SP  | im_low_dynamic_range |
| :-------: | :-----: | :-----: | :------------------: |
| PSNR (dB) | 38.0902 | 15.6806 |       23.9912        |

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

![image-20191024215850966](/Users/geekye/Documents/Courses/image processing/lab/Lab2-Materials/lab2-report/task1_4.png)

##### Analyze

The function of white gaussian noises makes histogram equalization to some degree and it looks like a low-pass filter.We can see two lines on each side on histogram of im_SP. The salt & pepper noises make some points equal to 0 or 255. The pixels of low_dynamic_range picture concentrates on the interval, so it has low contrast.

#### Try to use the technique of *Image Averaging* to remove the noise of sub-task ii, e.g., average 10 images to get *im_wn10*, average 100 images to get *im_wn100*, and average 1000 images to get *im_wn1000*. Evaluate the PSNR of these three images with respect to the reference image im. Comments and briefly explain this result. **(15’)** 

##### Code

```matlab
clear
clc
im = imread('lenna512.bmp')
[m, n] = size(im);
sum = zeros(m,n);

for i=1:10
    im_wn = guassian_noise(im,0,sqrt(10));
    im_wn = double(im_wn);
    sum = sum + im_wn;
end

im10_after = sum/10;
im10_after = uint8(im10_after);

figure(1)
imshow(im10_after);
title('im10 after');

im_wn10 = psnr(im, im10_after);

sum = zeros(m,n);
for i=1:100
    im_wn = guassian_noise(im,0,sqrt(10));
    im_wn = double(im_wn);
    sum = sum + im_wn;
end

im100_after = sum/100;
im100_after = uint8(im100_after)
figure(2)
imshow(im100_after);
title('im100 after')

im_wn100 = psnr(im, im100_after);


sum = zeros(m,n);
for i=1:1000
    im_wn = guassian_noise(im,0,sqrt(10));
    im_wn = double(im_wn);
    sum = sum + im_wn;
end

im1000_after = sum/1000;
im1000_after = uint8(im1000_after);

figure(3)
imshow(im1000_after);
title('im1000 after')

im_wn1000 = psnr(im, im1000_after);
```

##### Result

|  Image   | Im_wn10 | Im_wn100 | Im_wn100 |
| :------: | ------- | -------- | -------- |
| PSNR(dB) | 47.7511 | 57.5222  | 102.3162 |

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

```matlab
clear
clc
im = imread('lenna512.bmp')
im_low_dynamic_range = imread('lenna512_low_dynamic_range.bmp')

[m,n]=size(im_low_dynamic_range);

im_low_dynamic_range = double(im_low_dynamic_range)
after_image = piecewise_enhance(im_low_dynamic_range)

after_image = uint8(after_image)

psnr_enhanced_im = psnr(im, after_image)

figure(1)
imshow(uint8 ( after_image))
title('enhanced image')
figure(2)
imhist(uint8 ( after_image))    
title('enhanced image')

figure(3)
imshow(im)
title('original image')
figure(4)
imhist(im)
title('original image')
```

##### Best function I obtained.

```matlab
function y = piecewise_enhance(x)

%     check all column and row and count exception number > 0
% I don't want to catch this exception because i want to stop program when error happen

if (sum(sum(x>255)) >0) || sum((sum(x<0))>0)
    ME = MException(1,'parameter error')
    throw(ME)
end

% optimal points are (64,32) , (193,224)
y= 32/64*x.*(x>=0 & x<64) + ((224-32)/(193-64)*(x-64)+32).*(x>=64&x<193)+((255-224)/(255-192)*(x-193)+224).*(x>=193 & x<=255);

% avoid out of 0-255
y = 255.*(y>255) + 0.*(y<0) + y.*(y>=0 & y<=255) ;

end

```

##### Result

##### Compare with original image

![image-20191025134450317](/Users/geekye/Documents/Courses/image processing/lab/Lab2-Materials/lab2-report/task2_133.png)

```matlab
psnr_enhanced_im =

   43.9289
```

#####  Compare different enhanced images with different parameters

<img src="/Users/geekye/Library/Application Support/typora-user-images/image-20191024232809712.png" alt="image-20191024232809712" style="zoom:50%;" /> <img src="/Users/geekye/Library/Application Support/typora-user-images/image-20191024232859075.png" alt="image-20191024232859075" style="zoom:50%;" />



<img src="/Users/geekye/Library/Application Support/typora-user-images/image-20191024233029161.png" alt="image-20191024233029161" style="zoom:50%;" /><img src="/Users/geekye/Library/Application Support/typora-user-images/image-20191024233127940.png" alt="image-20191024233127940" style="zoom:50%;" />



```matlab
psnr_enhanced1_im =

   39.4526
psnr_enhanced2_im =

   38.6728
psnr_enhanced3_im =

   41.5632
psnr_enhanced_im =

   43.9289
```

##### Analyze

The best function I obtained is here.

```matlab
% optimal points are (64,32) , (193,224)
y= 32/64*x.*(x>=0 & x<64) + ((224-32)/(193-64)*(x-64)+32).*(x>=64&x<193)+((255-224)/(255-192)*(x-193)+224).*(x>=193 & x<=255);

psnr_enhanced_im =

   43.9289
```

 When I change the parameters of piece-wise function, the psnr will decrease. In addition, I think it is impossible to generate the best one because equalization can't be implemented by linear functions completely. Therefore I use a function to find a better linear combination. Here is my code to find above parameters with psnr = 43.9289.

##### Code

```matlab
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
```

```matlab
function image_enhanced = MySegmentLinear(im,x1,x2,y1,y2)

im=double(im);
[m,n] = size(im);
image_enhanced = zeros(m,n);
 
for i=1:m
    for j=1:n
        if im(i,j)<x1
            image_enhanced(i,j) = y1 * im(i,j) / x1;
        elseif im(i,j)>x2
            image_enhanced(i,j) = (im(i,j)-x2)*(255-y2)/(255-x2) + y2;
        else
            image_enhanced(i,j) = (im(i,j)-x1)*(y2-y1)/(x2-x1) + y1;
        end
    end
end
 
image_enhanced = uint8(image_enhanced);
 
end
```

##### Analyze

As you can see from code, I use the loop for traversal points and compare PSNR by the original image and reconstructed image. When I get the largest PSNR, I record this data. In summary, Algorithm complexity of this method is very high and we have an equalization formula, but I think it is an innovation. 

#### Use the command histeq which enhances the contrast of the images by transforming the values in an intensity image. Compare the current result with the best intensity mapping function in (1). Comment and **briefly** explain your finding. 

##### Code

```matlab
enhanced_im_by_tool = histeq(im_low_dynamic_range)
psnr_histeq = psnr(im, enhanced_im_by_tool)

figure(7)
imshow(im_low_dynamic_range)
title('im low dynamic range')
figure(8)
imhist(im_low_dynamic_range)
title('im low dynamic range')

figure(5)
imshow(enhanced_im_by_tool)
title('enhanced im by tool')
figure(6)
imhist(enhanced_im_by_tool)
title('enhanced im by tool')
```

##### Result

![image-20191025004122743](/Users/geekye/Documents/Courses/image processing/lab/Lab2-Materials/lab2-report/task2_2.png)

![image-20191022191358922](/Users/geekye/Documents/Courses/image processing/lab/Lab2-Materials/lab2-report/task2_2_2.png)

```matlab
psnr_histeq =

   19.0767
```

##### Analyze

We can see from the result, the function of histeq is to avoid pixels concentrating on the interval.When we compare histeq with the best intensity mapping function, we can find the psnr of piece-wise mapping function is better than that of histeq. In addition I compare the histogram of two images and I find that if we use equalization to enhance pictures, the image could lose features. In summary, piece-wise mapping will be better than equalization in some case.

Let $A_0$ represents the whole number of pixels, $L$ represents the value of pixel 255. 

Continuous form
$$
f(D_A) = \frac{L}{A_0}\int_0^{D_A}H_A(D)dD
$$
Discrete form
$$
f(D_A) = \frac{L}{A_0}\sum_{u=0}^{D_A}H_A(u)
$$
Here is implementation by myself.

```matlab
clear
clc

im = imread('lenna512.bmp');

im_low_dynamic_range = imread('lenna512_low_dynamic_range.bmp');

[m, n] = size(im_low_dynamic_range);

reconstructed_im = zeros(m,n);

% count pixels

pixels = linspace(0,0,256);

for i = 1:m
    for j = 1:n
        index = im_low_dynamic_range(i,j)-1;
        pixels(index) = pixels(index) + 1;
    end
end

% reconstruct image
A_0 = m*n;
L = 255;
for i = 1:m
    for j =1:n
       value_pixel = im_low_dynamic_range(i,j);
       sum = 0;
       for k = 1:value_pixel+1
           sum = sum + pixels(k);
       end
       reconstructed_im(i,j) =  L/A_0 *sum;
    end 
end

imshow(uint8(reconstructed_im));
```

### Task 3 (**10**’)

#### Write the code to show the horizontal edges, vertical edges and all edges of the image *im.* Here, please use Sobel operators in the code. 

##### Code

```matlab
im = imread('lenna512.bmp');
im = im2double((im));
sobel_vertical=[1.0 2.0 1.0;0.0 0.0 0.0; -1.0 -2.0 -1.0];
sobel_horizontal=[-1.0 0.0 1.0; -2.0 0.0 2.0; -1.0 0.0 1.0];
sobel_threshold_all = 0.5;

horizontal_detection = abs(imfilter(im, sobel_horizontal));

vertical_detection = abs(imfilter(im, sobel_vertical));

all_detection = sqrt(horizontal_detection.^2+(vertical_detection).^2);

% make all points at 0-255 and convert it into 0-1
all_detection = im2double(im2uint8(all_detection))

completed_detection = all_detection > sobel_threshold_all

figure(1)
imshow(horizontal_detection)
title('horizontal detection')
figure(2)
imshow(vertical_detection)
title('vertical detection')
figure(3)
imshow(completed_detection)
title('all detection')
```

##### Result

![image-20191025014158503](/Users/geekye/Documents/Courses/image processing/lab/Lab2-Materials/lab2-report/task3_5.png)

##### Analyze

As we can see from result, horizontal sobel can detect horizontal lines and vertical soble can detect vertical lines. Furthermore, All detection can detect all edge. We can know the principle from the formula.
$$
\begin{equation}
\begin{split}
G_x &= \begin{bmatrix} 
 -1&0&1 \\
 -2&0&2 \\
 -1&0&1
\end{bmatrix}*A \\
\\
G_y &= \begin{bmatrix}
1&2&1\\
0&0&0\\
-1&-2&-1
\end{bmatrix}*A \\
\\
G &= \sqrt{G_x^2+G_y^2} 
\end{split}
\end{equation}
$$


Everyone knows that sobel use first order differential to detect edge, but why we use 2 weights in matrix. I search this on the Internet, It is found in a blog, here is the url. http://blog.sciencenet.cn/blog-425437-1139187.html .The author explain that 2 represent the D4 distance.

### Task 4 (**20’**): 

#### Apply the median filter with a 3X3 window and a 5X5 window on the image im_SP. Display and evaluate the PSNR of the obtained images. For each window size, comment on how effectively the noise is reduced while sharp edges and features in the image are preserved. 

##### Code

```matlab
clear
clc

im = imread('lenna512.bmp');

im_sp = generate_saltpepper(im, 0.1);

% 3*3 filter
im_recover_3=medfilt2(im_sp,[3,3]);

figure(1);
imshow(uint8(im_recover_3));
title('3*3 filter')
psnr_filter3 = psnr(im, im_recover_3)

% 5*5 filter
im_recover_5 = medfilt2(im_sp, [5 5]);
figure(2);
imshow(uint8(im_recover_5));
title('5*5 filter')
psnr_filter5 = psnr(im, im_recover_5)

```

##### Result

![image-20191025015405086](/Users/geekye/Documents/Courses/image processing/lab/Lab2-Materials/lab2-report/task5_1.png)

```matlab
psnr_filter3 =

   33.1051


psnr_filter5 =

   30.4041
```

##### Analyze

It is definitely that median filter can remove salt & pepper noise. But we can see from result and PSNR, 3*3 filter has a better quality image, on the other hand, 5 * 5 filters reduce the shape edges of pictures. The bigger filter size become, the more edges will be lost.

I find a interesting thing about how to calculate padding size.

Let $n$ represents original magnitude，$f$ represents filter size.
$$
result\_ size = n-f+1
$$
Let's consider padding size, the formula will become this.
$$
result\_size = n-f+1+2*padding\_size
$$
In addition, I choose quick sort. Of course, the sort() function in matlab may be more powerful. But it is meaningful to implement by myself.

```matlab
function x = my_quick_sort(x, left_index, right_index)

original_left_index = left_index;
original_right_index = right_index;

if left_index >= right_index
    return;
end

base = x(left_index);

while left_index < right_index
    
    while (left_index < right_index) && x(right_index) >= base
        right_index = right_index - 1 ;
    end
    
    while (left_index < right_index) && x(left_index) <= base
        left_index = left_index + 1;
    end
    
    temp = x(left_index);
    x(left_index) = x(right_index);
    x(right_index) = temp;
    
end

temp = x(left_index);
x(left_index) = base;
x(original_left_index) = temp;

x = my_quick_sort(x, original_left_index, left_index-1);
x = my_quick_sort(x, right_index+1, original_right_index);

end
```



#### Use the average filter 3X3 to filter the image im_SP. Compute the PSNR and display the filtered image. As you experimented with the mean and median algorithms what different “performance” did you notice? Was the average or median filter better, and why? 

##### Code

```matlab
mean_filter_kernal=1/9*[1 1 1; 1 1 1; 1 1 1];
im_recover_mean = uint8(conv2(im_sp, mean_filter_kernal, 'same'));
imshow(im_recover_mean);
psnr_filter_mean = psnr(im, im_recover_mean)
```

Result

![image-20191023143215227](/Users/geekye/Documents/Courses/image processing/lab/Lab2-Materials/lab2-report/task4_3.png)

```maltb
psnr_filter_mean =

   23.9525
```

##### Analyze

We can see from the result, mean filter has a bad performance for salt & pepper noise. Median filter is better than mean filter. The reason for this phenomenon is that the median filter can make the special value separate on two sides and choose the median instead of replacing the mean value. Median filter can remove special noise(salt & pepper noise) effectively. The median filter is different from the mean filter, they are non-linear smoothing filter and linear smoothing filter separately.

### Conclusion and discussion 

Firstly, I learned how to create gaussian and salt & pepper noise and the difference between the two noise. Secondly, I practice the skill in removing Gaussian noise by sampling superposition. Thirdly, I noticed that the equalization formula is the best way to enhance pictures instead of linear mapping. Fourthly, I knew the principle of Sobel detection. Finally, I practice the median filter and mean filter and how to choose them in a different situation. Moreover, I review some sorting algorithms.
On the other hand, I want to know other detection algorithms such as the Laplace operator. In the lecture, it is a second-order differential operator.OCR is a big domain for me to study. I will survey and practice this algorithm in my spare time.