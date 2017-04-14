%% Exercise 1
% Max Bos (10669027) and Philip Bouman (10668667)

function main()

    close all
    img = im2double(imread('cameraman.tif'));

    %% Question 2.1.1 / Question 2.1.2
    % Check out the implementation of
    % pixelValue(image, x, y, interpolationMethod, borderMethod)
    
    %% Question 2.1.3
    % Comparement of (bi)linear and nearest profile.
    figure('name', 'Interpolation Profiles (nearest:b vs. linear:r)')
    hold on;
    plot(profile(img, 100, 100, 120, 120, 200, 'nearest', 'constant'), 'b');
    plot(profile(img, 100, 100, 120, 120, 200, 'linear', 'constant'), 'r');
    hold off;
    
    %% Question 2.1.4
    % pixelValue supports three different border methods: constant,
    % nearest and periodic. See report for discussion on the different 
    % methods.
    figure('name', 'Border Methods (nearest:b vs. periodic:r)')
    hold on;
    plot(profile(img, -100, -100, 300, 300, 200, 'nearest', 'nearest'), 'b');
    plot(profile(img, -100, -100, 300, 300, 200, 'nearest', 'periodic'), 'r');
    hold off;
    
    %% Question 3.1.1 / Question 3.1.2
    % See the implementation of 
    % rotateImage(image, angle, interpolationMethod, borderMethod, addMargins)
    rotatedImage = rotateImage(img, pi/6, 'linear');
    figure('name', 'Q3.1.2 / Q3.1.2 : pi/6 angle')
    imshow(rotatedImage)
    
    %% Question 3.1.3
    % We've added an addMargins flag to rotateImage() which results
    % in a complete picture as output. See rotateImage() for further details.
    figure('name', 'Image after 45deg rotation w/ constant border method')
    rotatedImage = rotateImage(img, pi/6, 'linear', 'constant', true);
    imshow(rotatedImage)
    figure('name', 'Image after 45deg rotation w/ nearest border method')
    rotatedImage = rotateImage(img, pi/6, 'linear', 'nearest', true);
    imshow(rotatedImage)
    figure('name', 'Image after 45deg rotation w/ periodic border method')
    rotatedImage = rotateImage(img, pi/6, 'linear', 'periodic', true);
    imshow(rotatedImage)
    
    %% Question 3.1.4
    % Processing time performance measure of both interpolation methods.
    disp('Processing time for nearest interpolation:')
    tic;
    rotateImage(img, pi/4, 'nearest');
    toc;
    disp('Processing time for (bi)linear interpolation:')
    tic;
    rotateImage(img, pi/4, 'linear');
    toc;
    
    %% Question 3.1.5
    % The distance, between the original and interpolated version of 
    % the image is measured using Euclidean distance.
    imgNearest = rotateImage(img, pi/6, 'nearest', 'constant', true);
    imgNearest = rotateImage(imgNearest, -pi/6, 'nearest');
    figure('name', 'Image after double rotation w/ nearest interpolation')
    imshow(imgNearest)
    
    imgLinear = rotateImage(img, pi/6, 'linear', 'constant', true);
    imgLinear = rotateImage(imgLinear, -pi/6, 'linear');
    figure('name', 'Image after double rotation w/ linear interpolation')
    imshow(imgLinear)
 
    borderedImage = borderImage(img, pi/6);
    figure('name', 'Image w/ border')
    imshow(borderedImage)
    
    distNearest = euclideanDistance(borderedImage, imgNearest);
    distLinear = euclideanDistance(borderedImage, imgLinear);
    distDiff = abs(distNearest - distLinear);

    fprintf('Distance (nearest): %f; distance (linear): %f, distance difference: %f\n', ...
        distNearest, distLinear, distDiff);
   
    %% Question 4.
end