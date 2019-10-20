clear 
clc
load('data_for_labC.mat')

[m, n, k] = size(eignfaces_blk);

for i = 1:k
    
%     norm_value = sqrt(sum(sum(eignfaces_blk(:,:,k).^2)));
    norm_value = norm(eignfaces_blk(:,:,k));
    if(norm_value ~= 1)
        eignfaces_blk(:,:,k)  = eignfaces_blk(:,:,k)./norm_value;
    end
end


for i =1:k
    
    norm_value = norm(eignfaces_blk(:,:,k)); 
    norm_value = int32(norm_value);
    
    if(norm_value == 1)
        disp('it is a orthnologinal')     
    else
        disp('it is not a orthnologinal') 
    end
    
end
