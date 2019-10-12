function x = my_quick_sort(x, left_index, right_index)

original_left_index = left_index;
original_right_index = right_index;

if left_index >= right_index
    return;
end


base = x(left_index);

while left_index < right_index
    
    while (left_index < right_index) && x(right_index) >= base
        right_index = right_index - 1 ;
    end
    
    while (left_index < right_index) && x(left_index) <= base
        left_index = left_index + 1;
    end
    
    temp = x(left_index);
    x(left_index) = x(right_index);
    x(right_index) = temp;
    
end

% left_index

temp = x(left_index);
x(left_index) = base;
x(original_left_index) = temp;


x = my_quick_sort(x, original_left_index, left_index-1);
x = my_quick_sort(x, right_index+1, original_right_index);

end