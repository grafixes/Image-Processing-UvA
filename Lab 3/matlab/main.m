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
    
    figure('name', 'Section 3: Finding the Lines as Local Maxima');
    imshow(img);
    hold on
    x1 = 0;
    x2 = size(img, 2);
    for i = 1:length(lines)
        line = lines(i,:);
        y1 = (-line(1)*x1-line(3))/line(2);
        y2 = (-line(1)*x2-line(3))/line(2);
        xy = [x1 y1; x2 y2];
        plot(xy(:,1), xy(:,2), 'Color', 'b');
    end
    hold off
    
end