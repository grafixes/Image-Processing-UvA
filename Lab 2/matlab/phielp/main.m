%% Exercise 2
% Max Bos (10669027) and Philip Bouman (10668667)

function main()
%% 1. Convolution

im = imread('cameraman.tif');

% Motionblur (shift 5 px to the right)
mblur = 1/6 * [1 1 1 1 1 1];
% Intensity increase by 3
intens = 3;
% Average 3x3 neighbourhood
average = 1/9 *[1 1 1; 1 1 1; 1 1 1];

% Plot results
figure;
subplot(2, 2, 1);
imshow(imfilter(im, mblur, 'conv', 'replicate'));
title('Motion blur with 5px to right');
subplot(2, 2, 2);
imshow(imfilter(im, intens, 'conv', 'replicate'));
title('Increased intensity (+3)');
subplot(2, 2, 3);
imshow(imfilter(im, average, 'conv', 'replicate'));
title('Average from 3x3 neighbourhood');

%% 2. Implementation of Gaussian derivatives

sum(sum(Gauss(3)))
sum(Gauss1(3))
% area is always 1

% kernel plot
figure;
mesh(Gauss(3))

% 2D vs. 1D complexity plot

for i=1:10
    tic;
    H = imfilter(im, Gauss(i), 'conv', 'replicate');
    elapsedTime(i) = toc;
end
figure;
plot(elapsedTime);
xlabel('sigma');
ylabel('time');
title('Gaussian complexity');

hold on;
for i=1:10
    tic;
    H = imfilter(im, Gauss1(i)', 'conv', 'replicate');
    elapsedTime(i) = toc;
end
plot(elapsedTime);
hold off;

legend('2D', '1D');

% derivatives

figure;
imshow(gD(im,0.5,1,2));

end

