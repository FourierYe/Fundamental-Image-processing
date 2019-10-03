function worked_matrix = biliner_interpolation_1(image, scale)

% create return matrix
worked_matrix = zeros(size(image)*scale);
worked_matrix = im2double(worked_matrix);

padding_matrix = zeros(size(image) + 2);
padding_matrix = im2double(padding_matrix);
padding_matrix(2 : end-1, 2 : end-1) = image;

% padding processing
padding_matrix([1 end],:) = padding_matrix([2 end-1],:);
padding_matrix(:,[1 end]) = padding_matrix(:, [2 end-1]);

[m, n] = size(worked_matrix);

for i = 1: m
    for j = 1: n
        
        x = i/scale;
        y = j/scale;
       
%         compute this original index 
        i_original = floor(x);
        j_original = floor(y);
        
%         computer the coefficient
        u=x-i_original;
        v=y-j_original;
        
        i_original=i_original+1;
        j_original=j_original+1;
        
%         follow by this formula 
        worked_matrix(i, j) = (1-u)*(1-v)*padding_matrix(i_original,j_original) +...
            (1-u)*v*padding_matrix(i_original,j_original+1) +...
            u*(1-v)*padding_matrix(i_original+1,j_original) +...
            u*v*padding_matrix(i_original+1,j_original+1);
        
    end
end

% convert double into uin8 type
worked_matrix = uint8(worked_matrix);