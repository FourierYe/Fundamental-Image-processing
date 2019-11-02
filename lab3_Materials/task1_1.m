clear
clc
load('data_for_labC.mat')

[m, n, k] = size(eignfaces_blk);

% k-1 means 101-1=100

for i = 1:k-2
    for j = i+1:k-1
        
%         check the result of them multiplying to each other is 0
        matrix = eignfaces_blk(:,:,i).*eignfaces_blk(:,:,j);
        
        check_value = int16(sum(sum(matrix)));
        
%         compare two value in matlab must use this formula
        if (abs(check_value - 0) > 0.000001)
            sprintf('i:%d,j:%d', i,j)
            disp('These eignface are not orthogonal!')
        end
        
    end
end
