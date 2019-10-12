function y = piecewise_enhance(x)
    if(x>=0 & x < 100)
        y=4/5*x;
    elseif(x>100 & x<130)
        y=5/4*x;
    else
        y=6/4*x;
    end
end