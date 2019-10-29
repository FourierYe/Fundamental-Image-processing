function ID = get_employees_ID_from_DB (im, employees_DB, eigenfaces_blk)
    
    [m,n,k] = size(eigenfaces_blk);
    
    weights_of_face = get_face_weights(im,eigenfaces_blk);
    employer_distance_list = [];
    for i = 1:k
        employer_weights = employees_DB(i).weights;
        employer_weights = employer_weights(1:end-1)
        Euclidean_distance = sqrt(sum((weights_of_face - employer_weights).^2));
        employ.id = i;
        employ.distance = Euclidean_distance;
        employer_distance_list = [employer_distance_list,employ];
    end
    
    [employer_distance_list_sorted, index] = sort([employer_distance_list.distance]);
    
    ID = employer_distance_list(index).id
end
