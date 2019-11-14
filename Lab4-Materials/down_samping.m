% The vision of my matlab is R2017, I can't use the mean function. So I
% implement an algorithm.

function narrow_matrix=down_samping(matrix)
   [m,n]=size(matrix);
   matrix_double=im2double(matrix);
   narrow_matrix=zeros(m/2,n/2);
   for i=1:2:m
       for j=1:2:n
%            calculate the mean of neighbor 
           mean_value=(matrix_double(i,j)+matrix_double(i,j+1)+matrix_double(i+1,j)+matrix_double(i+1,j+1))/4;
           narrow_matrix((i+1)/2,(j+1)/2)=mean_value;
       end
   end
end