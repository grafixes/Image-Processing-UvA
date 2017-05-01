%% Exercise 3
% Max Bos (10669027) and Philip Bouman (10668667)


function main()
    close all
    image = im2double(imread('shapes.png'));

    %% Question 2.1a
    
    % canny edge detector from lab 2
	e1 = canny(image, 1);
    
    % built in canny edge detector
    imBin = imbinarize(rgb2gray(image));
	e2 = edge(imBin,'Canny');

    % show results
	figure;
	subplot(1,2,1);
	imshow(e1);
	subplot(1,2,2);
	imshow(e2);
    
    %% Question 2.1b
    
    accumulator = hough(imBin, 100, 100);
    
    figure;
    subplot(1,2,1);
    imshow(image);
    subplot(1,2,1);
    imshow(accumulator, []);
    
end