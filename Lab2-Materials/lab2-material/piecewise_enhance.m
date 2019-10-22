function y = piecewise_enhance(x)
    if(x>=0 & x < 96)
        y=0.8351*x;
    elseif(x>96 & x<145)
        y=0.9796*x;
    else
        y=1.1636*x;
    end
end