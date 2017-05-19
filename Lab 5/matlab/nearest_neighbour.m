%% NEAREST NEIGHBOUR
% Given:
%   images      -   a dataset of images
%   train_n     -   number of datapoints in train set
%   d           -   number of dimensionality reduction
% Returns:
%   accuracy    -   the degree to which the correct positions are found
function accuracy = nearest_neighbour(images, train_n, d)

    [train_set, test_set] = separate_data(images, train_n);
    test_n = numel(test_set);
    X = data_matrix(train_set);
    test_X = data_matrix(test_set);
    
    % apply PCA if the dimensionality reduction parameter is set
    if d > 0
        [Y, PC, ~] = pca(X, d);
        % project the test set onto the PCA component
        test_PC = (Y * minus_mean(test_X)')';
        train_imgs = PC;
        test_imgs = test_PC;
    else
        train_imgs = X;
        test_imgs = test_X;
    end
    
    imagestruct = [images{:}];
    positions = vertcat(imagestruct.position);
    
    % for each image in the test set, find the closest image 
    % in the training set
    closest_found = 0;
    for i = 1:test_n
        % get the test image
        test_img = test_imgs(i, :);
        % calculate the Euclidean distance between the training images 
        % (Principal Components) and the test image (Principal Component)
        distance = sqrt(sum((train_imgs-test_img).^2, 2));
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
    
    accuracy = closest_found / test_n;
end