function filtered_image = median_filter(im, filter_size)

[m, n] = size(im);

% padding
padding_size = (filter_size-1)/2;

im_sp_padding = zeros(m+2*padding_size,n+2*padding_size);

im_sp_padding(padding_size+1:end-padding_size,padding_size+1:end-padding_size) = im;

filtered_image = zeros(m,n);

for i=1:m-filter_size+padding_size+1
    
    for j = 1:n-filter_size+padding_size+1
%         reshape
        vector = reshape(im_sp_padding(i:i+filter_size-1,j:j+filter_size-1),[1,filter_size^2]);
%         sort
        vevtor_sorted = my_quick_sort(vector,1,filter_size^2);
%         get median value
        filtered_image(i,j)= vevtor_sorted((filter_size^2+1)/2);
    end
    
end

end