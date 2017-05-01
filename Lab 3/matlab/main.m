%% Exercise 3
% Max Bos (10669027) and Haischel Dabian ()

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
end