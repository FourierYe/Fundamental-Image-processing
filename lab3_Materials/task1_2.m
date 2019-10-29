clear
clc
load('data_for_labC.mat')

[m, n, k] = size(eignfaces_blk);

eignfaces_blk_copy = zeros(m,n,k-1);

for i = 1:k-1
    
    norm_value = sqrt(sum(sum(eignfaces_blk(:,:,i).^2)));
    
    if (abs(norm_value - 1) > 0.01)
        
        disp(norm_value)
        disp('it is not a orthnologinal')
        eignfaces_blk_copy(:,:,i)  = eignfaces_blk(:,:,i)./norm_value;
    end
    
end

count = 0
for i =1:k-1
    
    norm_value = sqrt(sum(sum(eignfaces_blk_copy(:,:,i).^2)));
    
    if(abs(norm_value - 1)<0.001)
        count = count+1;
        disp('it is a orthnologinal');
    else
        disp('it is not a orthnologinal')
    end
    
end
sprintf('The number of orthnologinal = %d',count)
