% neighbor interpolation
function zoom_out_image=neighbor_interpolation(image)
    [m,n]=size(image);
    zoom_out_image=zeros(2*m,2*n);
    for i=1:2:2*m
        for j=1:2:2*n
            zoom_out_image(i:i+1,j:j+1)=image((i+1)/2,(j+1)/2);
        end
    end
end