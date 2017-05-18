%% Exercise 5
% Max Bos (10669027) and Haischel Dabian (10336230)

function main()

    clear
    close all
    
    %% (Sec.2) Principal Component Analysis
    load omni
    
    % Split our dataset into a 'training' set of 300 images 
    % and a test set containing the rest.
    [train_set, test_set] = separate_data(images, 300);
    
    % Construct a matrix X, containing the train data with size n by d
    % with n the number of datapoints and d the number of data 
    % dimensions (16800 for our vectorized images).
    X = data_matrix(train_set);
    
    %% (Sec.2.1) Apply PCA to our dataset to reduce dimensionality of 
    % the data to d, making d a configureable parameter.
    % Apply PCA to our X matrix, with a d of 100.
    [Y, ~, D] = pca(X, 100);
    
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
    % of the images. Find the closest image in the training set and
    % evaluate your accuracy.
    accuracy = nearest_neighbour(images, 300, 100)
    
    %% Would results improve if we were to remove the nearly black
    % borders of our images? Why?
    % - The results of removing the black border would be very small,
    % since the removal of this border would not have a big impact on 
    % the variance.
    
    %% Experiment with the number of PCA components used when positioning
    accuracy = nearest_neighbour(images, 300, 10)
    accuracy = nearest_neighbour(images, 300, 50)
    accuracy = nearest_neighbour(images, 300, 100)
    accuracy = nearest_neighbour(images, 300, 200)
    accuracy = nearest_neighbour(images, 300, 300)
    
    %% What if we were to leave out the PCA step? The Nearest Neighbour
    % algorithm is able to handle all 16800 dimensions computationally.
    % But will it work on the raw images, or suffer from the curse 
    % of dimensionality? Try it!
    
    
end