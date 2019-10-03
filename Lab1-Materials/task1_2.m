% Firstly, I can't find the tool for transformation of rgb to hsi, But I find the tool for transformation of rgb to hsv.
% Therefore, I code about transformation of rgb to hsv.
% After learning about the theory of HSI, I create a new vision of this question.

image=imread('lenna512color.bmp');

% convert RGB to HSV
% image_hsv=rgb2hsv(image);

% convert RGB to HSI
R_component=im2double( image(:,:,1));
G_component=im2double(image(:,:,2));
B_component=im2double(image(:,:,3));

[m, n, q] = size(image);
H=zeros(m, n);
S=H;
for i=1:m
    for j=1:n
        numerator = 0.5*(R_component(i,j)-G_component(i,j)+R_component(i,j)-B_component(i,j));
        denominator = sqrt( ((R_component(i, j) - G_component(i, j))^2 + (R_component(i, j) - B_component(i, j)) * ( G_component(i,j)- B_component(i,j) )));
        theta = acos(numerator/denominator)*180/pi;
        if( B_component(i,j)<=G_component(i,j))
            H(i,j)=theta;
        else
            H(i,j)= 360-theta;
        end
        min_1 = min(G_component(i,j),G_component(i,j));
        min_1 = min(min_1, B_component(i,j));
        S(i,j) = 1 - 3/(R_component(i,j) + G_component(i, j) + B_component(i, j))*min_1;
        
    end
end

I = (R_component+G_component+B_component)/3;

image_hsi=cat(3, im2uint8(H),im2uint8(S),im2uint8(I));

subplot(2,2,1);
imshow(image_hsi);
title('HSI_ image');

% h(Hue) component
subplot(2,2,2);
imshow(image_hsi(:,:,1));
title('Hue component');

% s(Saturation) component
subplot(2,2,3);
imshow(image_hsi(:,:,2));
title('Saturation component');

% I(Intensity) component
subplot(2,2,4);
imshow(image_hsi(:,:,3));
title('Intensity component');