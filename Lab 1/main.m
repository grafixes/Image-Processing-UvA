%% Exercise 1
% Max Bos (10669027) and Philip Bouman ()

function main()

    close all
    img = im2double(imread('cameraman.tif'));

    %% Question 2.1.1 / Question 2.1.2
    % 
    
    %% Question 2.1.3
    plot(profile(img, -100, 1, 400, 1, 100, 'linear', 'nearest'), 'y');
    hold;
    plot(profile(img, -100, 1, 400, 1, 100, 'nearest', 'nearest'), 'r');
    
    %% Question 2.1.4
    % pixelValue supports three different border methods: constant,
    % nearest and periodic.
    
    %% Question 3.1.1
end