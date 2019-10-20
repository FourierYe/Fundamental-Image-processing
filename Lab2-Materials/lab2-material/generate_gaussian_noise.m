function gaussian_noise_point = generate_gaussian_noise()
    gaussian_x = 100*rand();
    gaussian_noise_point = gaussian_function(gaussian_x);
    if rand()<0.5
        gaussian_noise_point = - gaussian_noise_point;
    end
end