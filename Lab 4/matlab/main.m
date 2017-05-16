%% Exercise 4
% Max Bos (10669027) and Haischel Dabian (10336230)

function main()

    clear
    close all

    %% (Sec.3.3) Use vl_feat to find matches for the Nachtwacht images.
    % Visualize the matches.
    img1 = single(rgb2gray(imread('nachtwacht1.jpg'))) ;
    img2 = single(rgb2gray(imread('nachtwacht2.jpg'))) ;
    [F1, D1] = vl_sift(img1);
    [F2, D2] = vl_sift(img2);
    matches = vl_ubcmatch(D1, D2);

    figure;
    subplot(1,2,1)
    imshow(imread('nachtwacht1.jpg'));
    hold on
    quiver(F1(1, matches(1, :)),F1(2, matches(1, :)), ...
        F1(3, matches(1, :)), F1(4, matches(1, :)));
    subplot(1,2,2)
    imshow(imread('nachtwacht2.jpg'));
    hold on
    quiver(F2(1, matches(2, :)),F2(2, matches(2, :)), ...
        F2(3, matches(2, :)), F2(4, matches(2, :)));
    
    %% (Sec.3.4) Estimate the projection matrix based on 4 or more matches.
    % 4 correct points
    xy = [F1(1, matches(1, 2:5));
          F1(2, matches(1, 2:5))];   
    uv = [F2(1, matches(2, 2:5));
          F2(2, matches(2, 2:5))];
    % estimate projection matrix with code from assignment 1
    T = createProjectionMatrix(xy', uv'); 
    % coordinates from the matching keypoints in the first image
    coords = [F1(1, matches(1, :)); 
              F1(2, matches(1, :)); 
              ones(1, length(F1(1, matches(1, :))))];
    transformedCoords = T * coords;

    for i = 1:length(transformedCoords(1,:))
        transformedCoords(:,i) = transformedCoords(:,i) / transformedCoords(3,i);
    end
    
    display(transformedCoords);
    correct = [F2(1, matches(2, :)); 
               F2(2, matches(2, :)); 
               ones(1, length(F2(1, matches(2, :))))]; 
    % check the difference between the projection matrix and the correct coords      
    display(transformedCoords - correct); 
    
    % The matrix is a good approximation of the mapping from keypoint. The 
    % difference between the correct coordination of the correct matches and 
    % the transformed coordination is not very high. This is because the matches 
    % used where correct matches. If it would be bases on incorrect matches
    % the projectivity matrix would have been incorrect.
    
    %% (Sec.4) RANSAC
    matrix = ransac(matches, F1, F2, 4, 20, 0.25, 0.4);
    result = matrix * coords;
    for i = 1:length(result)
        result(:,i) = result (:,i) / result(3,i);
    end
    display(result);
    
    %% Mosaic Experiment 1
    mosaic('nachtwacht1.jpg', 'nachtwacht2.jpg', 4, 20, 1, 0.5);
    
    %% Mosaic Experiment 2
    mosaic('ankor1.jpg', 'ankor2.jpg', 4, 20, 1, 0.4);
end