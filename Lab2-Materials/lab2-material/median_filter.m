function filtered_image = median_filter(im, filter_size)

[m, n] = size(im);

im_sp_padding = zeros(m+2,n+2)

% padding

im_sp_padding(2:end-1,2:end-1) = im;

im_sp_padding([1 end],:)=im_sp_padding([2 end-1],:);

im_sp_padding(:,[1 end])=im_sp_padding(:,[2 end-1]);

filtered_image = zeros(m,n);

for i=1:m-3
    
    for j = 1:n-3
        vector = reshape(im_sp_padding(i:i+filter_size-1,j:j+filter_size-1),[1,filter_size^2]);
        vevtor_sorted = my_quick_sort(vector,1,filter_size^2);
        filtered_image(i,j)= vevtor_sorted((filter_size^2+1)/2);
    end
    
end

end