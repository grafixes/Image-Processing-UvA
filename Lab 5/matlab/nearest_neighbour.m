%% NEAREST NEIGHBOUR
function accuracy = nearest_neighbour(images, train_n, d)

    [train_set, test_set] = separate_data(images, train_n);
    X = data_matrix(train_set);
    test_X = data_matrix(test_set);
    
    [Y, PC, ~] = pca(X, d);
    
    imagestruct = [images{:}];
    positions = vertcat(imagestruct.position);
    
    % project the test set onto the PCA component
    test_PC = (Y * minus_mean(test_X)')';
    
    % for each image in the test set, find the closest image 
    % in the training set
    closest_found = 0;
    for i = 1:numel(test_set)
        % get the test image
        test_img = test_PC(i, :);
        % calculate the Euclidean distance between the training images 
        % (Principal Components) and the test image (Principal Component)
        distance = sqrt(sum((PC-test_img).^2, 2));
        % retrieve the index of the training image most similar to
        % the test image
        [~, min_distance_idx] = min(distance);
        % calculate the Euclidean distance between the correct test
        % image position and the found similar training image position
        pos_distance = sqrt(sum((positions(train_n + i, :) - ...
            positions(min_distance_idx, :)).^2));
        if pos_distance < 150
            closest_found = closest_found + 1;
        end
    end
    
    accuracy = closest_found / numel(test_set);
end