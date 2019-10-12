function gaussian_point = gaussian_function(x)
%     generate gaussian points
    variance = 10;
    standard_diff = sqrt(variance);
    
    gaussian_point = 1/(sqrt(2*pi)*standard_diff) * exp(-x^2/(2*variance));
end
