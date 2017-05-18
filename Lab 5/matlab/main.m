%% Exercise 5
% Max Bos (10669027) and Haischel Dabian (10336230)

function main()

    clear
    close all
    
    %% (Sec.2) Principal Component Analysis
    load omni
    
    % Split our dataset into a 'training' set of 300 images 
    % and a test set containing the rest.
    train_n = 300;
    test_n = 550-train_n;
    train_set = images(1:train_n);
    test_set = images((train_n+1):550);
    
    % Construct a matrix X, containing the train data with size n by d
    % with n the number of datapoints and d the number of data 
    % dimensions (16800 for our vectorized images).
    X = data_matrix(train_set);
    test_X = data_matrix(test_set);
    
    %% (Sec.2.1) Apply PCA to our dataset to reduce dimensionality of 
    % the data to d, making d a configureable parameter.
    
    % Apply PCA to our X matrix, with a d of 100.
    [Y, PC, D] = pca(X, 100);
    
    %% (Sec.2.2) Plot the first 9 PCA vectors as images
    % Get the first 9 PCA vectors.
    imsize = size(train_set{1}.img);
    first_nine = Y(1:9, :);
    figure('name', 'Q2.2: Plot the first 9 PCA vectors as images');
    for i = 1:9
        subplot(3, 3, i);
        imshow(reshape(first_nine(i,:), imsize), []);
    end
    
    %% (Sec.2.3) Plot the eigenvalues of the first 50 PCA components
    first_fifty = D(1:50);
    figure('name','Q2.3: Plot the eigenvalues of the first 50 PCA components');
    plot(1:50, first_fifty, '-ko', 'MarkerEdgeColor', 'r', ...
        'MarkerFaceColor', 'r', 'MarkerSize', 4);
    
    %% (Sec.2.4) Compare the speedup relative to the naive implementation 
    % of the image differences without the PCA
    
    %% (Sec.3.1) Project both the training and test set onto the
    % PCA components, yielding the reduced representation 
    % of the images.
    
    imagestruct = [images{:}];
    positions = vertcat(imagestruct.position);
    
    % project the test set onto the PCA component
    test_PC = (Y * minus_mean(test_X)')';
    
    % for each image in the test set, find the closest image 
    % in the training set
    closest_found = 0;
    for i = 1:test_n
        % get the test image
        test_img = test_PC(i, :);
        % calculate the Euclidean distance between the training images 
        % (Principal Components) and the test image (Principal Component)
        distance = sqrt(sum((PC-test_img).^2, 2));
        % sort the distance vector to get the minimal distance
        [~, min_distance_idx] = min(distance);
        % calculate the Euclidean distance between the correct test
        % image position and the found similar training image position
        pos_distance = sqrt(sum((positions(train_n + i, :) - ...
            positions(min_distance_idx, :)).^2));
        if pos_distance < 150
            closest_found = closest_found + 1;
        end
    end
    
    accuracy = closest_found / test_n
end