%% Exercise 3
% Max Bos (10669027) and Haischel Dabian (10336230)

function main()

    close all
    
    %% (Sec.2.1) Implementation of hough function
    % Write a function, hough that meets 
    % the specification in Listing 1.
    % See hough.m for the implementation.
    
    %% (Sec.2.2) Perform Hough transform on some images
    img = rgb2gray(imread('shapes.png'));
    H = hough(img, [0, 0.9], 200, 200);
    figure('name', 'Section 2: Perform Hough transform on some images');
    subplot(1, 2, 1);
    imshow(img);
    subplot(1, 2, 2);
    imshow(H, []);
    
    img = rgb2gray(imread('box.png'));
    H = hough(img, [0, 0.9], 200, 200);
    figure('name', 'Section 2: Perform Hough transform on some images');
    subplot(1, 2, 1);
    imshow(img);
    subplot(1, 2, 2);
    imshow(H, []);
    
    img = rgb2gray(imread('billboard.png'));
    H = hough(img, [0, 0.9], 200, 200);
    figure('name', 'Section 2: Perform Hough transform on some images');
    subplot(1, 2, 1);
    imshow(img);
    subplot(1, 2, 2);
    imshow(H, []);
    
    img = rgb2gray(imread('szeliski.png'));
    H = hough(img, [0, 0.9], 200, 200);
    figure('name', 'Section 2: Perform Hough transform on some images');
    subplot(1, 2, 1);
    imshow(img);
    subplot(1, 2, 2);
    imshow(H, []);
    
    %% (Sec.3) Implementation of houghlines function
    % Write a function with the specification in Listing 2.
    % Dilation is added to the houghlines function.
    % See the implementation of houghlines(image, H, thresh, dilate).
    img = rgb2gray(imread('shapes.png'));
    H = hough(img, [0, 0.9], 200, 200);
    lines = houghlines(img, H, 0.4, true);
    
    display_hough_lines(lines, img, ...
        'Section 3: Finding the Lines as Local Maxima');
    
    %% (Sec.5) Optimal Line Estimation
    img = rgb2gray(imread('shapes.png'));
    Thresh = [0, 0.9];
    H = hough(img, Thresh, 200, 200);
    lines = houghlines(img, H, 0.4, true);
    lines = optimal_lines_estimation(img, Thresh, lines);
    
    display_hough_lines(lines, img, ...
        'Section 5: Optimal Line Estimation');
    
    %% (Sec.6.1.1) Method 1: you can use pairs of lines to produce their 
    % intersection.
    img = rgb2gray(imread('szeliski.png'));
    Thresh = [0, 0.9];
    H = hough(img, Thresh, 200, 200);
    lines = houghlines(img, H, 0.4, true);
    lines = optimal_lines_estimation(img, Thresh, lines);
    
    display_hough_lines(lines, img, ...
        'Section 6: szeliski.png optimal Hough lines');
 
    intersecs = intersections(size(img), lines);
    display_intersections(intersecs, img, 'Section 6: Intersections');
    
    %% (Sec.6.1.4) Method 2: use the estimated lines immediately, because 
    % the 4 lines you found also determine the projective transformation.
    
    
    %% (Sec.6.1.5) - Use the Hough transform to detect lines and
    % straighten some of the images in the attachment.
    % Straightening of sleziski.png
    img = rgb2gray(imread('szeliski.png'));
    Thresh = [0, 0.9];
    H = hough(img, Thresh, 200, 200);
    lines = houghlines(img, H, 0.4, true);
    lines = optimal_lines_estimation(img, Thresh, lines);
    
    display_hough_lines(lines, img, ...
        'Section 6: szeliski.png optimal Hough lines');
    
    intersecs = intersections(size(img), lines);
    display_intersections(intersecs, img, ...
        'Section 6.1.5: szeliski.png intersections');
    
    szeliski = im2double(imread('szeliski.png'));
    figure('name', 'Frontal view of szeliski.png');
    transformedSzeliski = myProjection(szeliski, ...
        intersecs(1,1), intersecs(1,2), ...
        intersecs(2,1), intersecs(2,2), ...
        intersecs(4,1), intersecs(4,2), ...
        intersecs(3,1), intersecs(3,2), ... 
        300, 400, 'linear');
    imshow(transformedSzeliski)
    
    %% (Sec.6.1.5) - Use the Hough transform to detect lines and
    % straighten some of the images in the attachment.
    % Straightening of billboard.png
    img = rgb2gray(imread('billboard.png'));
    Thresh = [0.23, 0.9];
    H = hough(img, Thresh, 300, 300);
    lines = houghlines(img, H, 0.6, true);
    lines = optimal_lines_estimation(img, Thresh, lines);
    
    display_hough_lines(lines, img, ...
        'Section 6: billboard.png optimal Hough lines');
 
    intersecs = intersections(size(img), lines);
    display_intersections(intersecs, img, ...
         'Section 6.1.5: billboard.png intersections');
     
    billboard = im2double(imread('billboard.png'));
    figure('name', 'Frontal view of billboard.png');
    transformedBillboard = myProjection(billboard, ...
        intersecs(4,1), intersecs(4,2), ...
        intersecs(2,1), intersecs(2,2), ...
        intersecs(1,1), intersecs(1,2), ...
        intersecs(3,1), intersecs(3,2), ... 
        400, 200, 'linear');
    imshow(transformedBillboard)
end