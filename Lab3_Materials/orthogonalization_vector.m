function orthonormal_matrix = orthogonalization_vector(eignfaces_blk)
[m, n, k] = size(eignfaces_blk);

orthonormal_matrix = zeros(m,n,k-1);

% Standard orthogonalization
for i = 1:k-1
    
    norm_value = sqrt(sum(sum(eignfaces_blk(:,:,i).^2)));
    
    if (abs(norm_value - 1) > 0.01)
        
        disp(norm_value)
        disp('it is not a orthonormal')
        orthonormal_matrix(:,:,i)  = eignfaces_blk(:,:,i)./norm_value;
    end
    
end

end