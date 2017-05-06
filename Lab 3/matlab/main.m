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
    [y, x] = find(edge(img, 'Canny', Thresh) > 0);
    
    for i = 1:size(lines, 1)
        pts = points_of_line([x, y], lines(i,:), 10);
        lines(i,:) = line_through_points(pts);
    end
    
    display_hough_lines(lines, img, ...
        'Section 5: Optimal Line Estimation');
    
    %% (Sec.6) Using the Lines - Better Straightening
    img = rgb2gray(imread('szeliski.png'));
    Thresh = [0, 0.9];
    H = hough(img, Thresh, 200, 200);
    lines = houghlines(img, H, 0.4, true);
    [y, x] = find(edge(img, 'Canny', Thresh) > 0);
    
    for i = 1:size(lines, 1)
        pts = points_of_line([x, y], lines(i,:), 10);
        lines(i,:) = line_through_points(pts);
    end
    
    display_hough_lines(lines, img, ...
        'Section 6: szeliski.png optimal Hough lines');
    
    % Method 1: you can use pairs of lines to produce their intersection.
    intersecs = [];
    for i = 1:length(lines)
        for j = 1+i:length(lines)
            intersec_pnt = cross(lines(i,:), lines(j,:));
            intersecs = [intersecs; intersec_pnt/intersec_pnt(3)];
        end
    end
    
    figure('name', 'Section 6: Intersections');
    imshow(img);
    hold on
    for i = 1:length(intersecs)
        plot(intersecs(i, 1), intersecs(i, 2), 'r+');
    end
    hold off
    
    % Method 2: use the estimated lines immediately, because the 4 
    % lines you found also determine the projective transformation.
    
end