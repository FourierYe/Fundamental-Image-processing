clear 
clc
load('data_for_labC.mat')

[m, n, k] = size(eignfaces_blk);

for i = 1:k
    for j = i+1:k
        matrix = eignfaces_blk(:,:,i).*eignfaces_blk(:,:,j);
        
        check_value = int16(sum(sum(matrix)));
          
        if (check_value ~= 0)
            sprintf('i:%d,j:%d', i,j)
            disp('These eignface are not orthogonal!')
        end
        
    end
end
