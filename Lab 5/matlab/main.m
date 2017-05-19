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
    
    % Construct a matrix X, containing the training data with size n by d
    % with n the number of datapoints and d the number of data 
    % dimensions (16800 for our vectorized images).
    X = data_matrix(train_set);
    
    %% (Sec.2.1) Apply PCA to our dataset to reduce dimensionality of 
    % the data to d, making d a configureable parameter.
    % Apply PCA to our X matrix, with a d of 50.
    [Y, PC, D] = pca(X, 50);
    
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
    xlabel('Number of PCA Component');
    ylabel('Eigenvalue');
    
    %% Take an image from the set, and find the next best match using the
    % image similarty (the best match is of course the image itself!).
    image = PC(1, :);
    rest = PC(2:300, :);
    distance = sqrt(sum((rest-image).^2, 2));
    [~, idx] = sort(distance);
    
    figure('name', 'Similar images');
    subplot(1, 2, 1);
    imshow(train_set{idx(1)}.img, []);
    title('Original');
    subplot(1, 2, 2);
    imshow(train_set{idx(2)}.img, []);
    title('Most similar');
    
    %% (Sec.2.4) Compare the speedup relative to the naive implementation 
    % of the image differences without the PCA
    tic;
        image = X(1, :);
        rest = X(2:300, :);
        distance = sqrt(sum((rest-image).^2, 2));
        [~, ~] =  sort(distance);
    naive_time = toc;
        
    tic;
        image = PC(1, :);
        rest = PC(2:300, :);
        distance = sqrt(sum((rest-image).^2, 2));
        [~, ~] = sort(distance);
    pca_time = toc;
    
    speedup = naive_time/pca_time;
    disp(['The speedup of using PCA to using the naive implementation is ', ...
        num2str(speedup)]);
    
    %% (Sec.3.1) Project both the training and test set onto the
    % PCA components, yielding the reduced representation 
    % of the images. Find the closest image in the training set and
    % evaluate your accuracy.
    accuracy = nearest_neighbour(images, 300, 100);
    disp(['Accuracy of nearest neigbour, where d=100: ', ...
        num2str(accuracy * 100), '%']);
    
    %% (Sec.3.2) Would results improve if we were to remove the nearly black
    % borders of our images? Why?
    % - The results of removing the black border would be very small,
    % since the removal of this border would not have a big impact on 
    % the variance.
    
    %% (Sec.3.3) Experiment with the number of PCA components used when
    % positioning
    x = [1 10:10:290, 300];
    accuracy = zeros(1, numel(x));
    for i = 1:numel(x)
        accuracy(i) = nearest_neighbour(images, 300, x(i));
    end
    disp(accuracy)
    figure('name','Q3.3: Relation between PCA components and accuracy');
    plot([1 10:10:290, 300], accuracy, '-ko', 'MarkerEdgeColor', 'r', ...
        'MarkerFaceColor', 'r', 'MarkerSize', 4);
    xlabel('Number of PCA Components');
    ylabel('Nearest Neighbour Accuracy');
    
    %% (Sec.3.4) What if we were to leave out the PCA step? The Nearest
    % Neighbour algorithm is able to handle all 16800 dimensions
    % computationally. But will it work on the raw images, or suffer
    % from the curse of dimensionality? Try it!
    accuracy = nearest_neighbour(images, 300, 0);
    disp(['Accuracy of nearest neigbour, without PCA: ', ...
        num2str(accuracy * 100), '%']);
    
end