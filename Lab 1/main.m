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
    
    %% Question 3.1.1
end