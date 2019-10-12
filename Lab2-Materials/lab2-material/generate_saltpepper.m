function imagewithSP = generate_saltpepper(image, SNR)
    if(SNR>1 || SNR<0)
        imagewithSP = [];
        return;
    end

    [m, n] = size(image);
    
    loop = m * n * SNR;
    
    for i=1:loop
        x = floor(rand()*m);
        y = floor(rand()*n);
        if(rand<=0.5)
            value = 0; 
        else
            value = 255;
        end
        image(x+1,y+1)=value;
    end
    imagewithSP = image;
end