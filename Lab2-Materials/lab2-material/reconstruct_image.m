function reconstructed_image = reconstruct_image(im, x1, x2, k1 ,k2 ,k3)

[m, n] = size(im);

reconstructed_image=zeros(m,n);
 
for i = 1:m

    for j = 1:n
        if(im(i,j)>=0&& im(i,j)<=x1)
            reconstructed_image(i,j)=im(i,j)*k1;
        end
        if(im(i,j)>x1&&im(i,j)<=x2)
            reconstructed_image(i,j)=im(i,j)*k2;
        end
        if(im(i,j)>x2 && im(i,j)<=255)
            reconstructed_image(i,j)=im(i,j)*k3;
        end
    end

end

end