%% Exercise 2
% Max Bos (10669027) and Philip Bouman (10668667)

function main()

    close all
    image = im2double(imread('cameraman.tif'));
    
    %% Question 2.1
    % See the implementation of Gauss(sigma).
    % We believe ceil(3*sigma)=a is an appropriate radius for the kernel. 
    % Which results in a grid size of (a*2+1)x(a*2+1). This is based on 
    % the three-sigma rule. This rule states that 99.7% of the data are 
    % within 3 standard deviations of the mean.
    sigma = 0.6;
    Gauss(sigma)
    
    %% Question 2.2
    % It is expected that the result of the overall sum of 
    % the Gaussian kernel is 1. Since, the Gaussian distribution is 
    % a probability distribution, which is normalized, so the sum over
    % all values of the kernel gives a probability of 1.
    sum(sum(Gauss(0.6)))
    sum(sum(Gauss(2.5)))
    sum(sum(Gauss(3)))
    
    %% Question 2.3
    mesh(Gauss(3))
    
    %% Question 2.4
    % The physical unit of the scale parameter sigma is pixel unit.
    
    %% Question 2.5
    sigmas = 1:40;
    reps = 40;
    for i = 1:length(sigmas)
        totalRunTime = 0;
        for j = 1:reps
           totalRunTime = totalRunTime + calcTime(image, sigmas(i));
        end
        sigmas(i) = totalRunTime / reps;
    end
    figure
    plot(sigmas);
    
    %% Question 2.6
    % The order of the computational complexity seems to be quadratic.
    
    %% Question 2.7
    sigma = 3;
    consecutiveConv = conv2(Gauss(sigma), Gauss(sigma));
    imgConsecutiveConv = imfilter(image, consecutiveConv, 'conv', 'replicate');
    imgSingleConv = imfilter(image, Gauss(sigma), 'conv', 'replicate');
    imgDifference = imabsdiff(imgConsecutiveConv, imgSingleConv);
    figure
    imshow(imgDifference)
    
    %% Question 2.8
    % See the implementation of Gauss1.
    % The sum of all the values equals 1.
    sum(Gauss1(0.6))
    sum(Gauss1(3))
    
    %% Question 2.9
    % The order of computational complexity seems to be quadratic
    % using the separability property.
    sigmas = 1:40;
    reps = 40;
    for i = 1:length(sigmas)
        totalRunTime = 0;
        for j = 1:reps
           totalRunTime = totalRunTime + calcTimeSep(image, sigmas(i));
        end
        sigmas(i) = totalRunTime / reps;
    end
    figure
    plot(sigmas);
    
    %% Question 2.10
    % See the implementation of gD(image, sigma, xorder, yorder).
    figure
    F = gD(image, 1, 0, 2);
    imshow(F, []);
    figure
    F = gD(image, 5, 1, 0);
    imshow(F, []);
    
    %% Question 2.11
    % See our report
    figure
    F = gD(image, 2, 2, 2);
    imshow(F, []);
    
    %% Question 3.1
end