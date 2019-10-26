function y = piecewise_enhance(x)

%     check all column and row and count exception number > 0
% I don't want to catch this exception because i want to stop program when error happen

if (sum(sum(x>255)) >0) || sum((sum(x<0))>0)
    ME = MException(1,'parameter error')
    throw(ME)
end

% optimal points are (64,32) , (193,224)
y= 32/64*x.*(x>=0 & x<64) + ((224-32)/(193-64)*(x-64)+32).*(x>=64&x<193)+((255-224)/(255-192)*(x-193)+224).*(x>=193 & x<=255);

% avoid out of 0-255
y = 255.*(y>255) + 0.*(y<0) + y.*(y>=0 & y<=255) ;

end
