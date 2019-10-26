function im_wn = guassian_noise(im, mu, sigma)

    [m,n] = size (im);
    
    guassian_points = mu + sigma * randn(m,n);
    
    im_wn = double(im) + guassian_points;
    
    im_wn = uint8(im_wn);
    
end
