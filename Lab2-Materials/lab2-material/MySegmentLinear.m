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