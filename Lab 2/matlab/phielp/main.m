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

%% derivatives

figure;
imshow(gD(im,0.5,1,2),[]);

% figure
% F = gD(im, 1, 2, 2);
% imshow(F, []);
    
%% 3. Canny Edge Detector

%% 3.2
x = -100:100;
y = -100:100;
[X, Y] = meshgrid(x,y);

A = 1; B = 2; V = 6*pi/201; W = 4*pi/201;
F = A * sin(V*X) + B * cos(W*Y);
Fx = A * V * cos(V * X);
Fy = -B * W * sin(W * Y);
Fxx = -(A * V)^2 * sin(V * X);
Fyy = -(B * W)^2 * cos(W * Y);

figure;
subplot(2,3,1);
imshow(F, [], 'xData', x, 'yData', y);
title('original');
subplot(2,3,2);
imshow(Fx, [], 'xData', x, 'yData', y);
title('1st order derivative in x-dir.');
subplot(2,3,3);
imshow(Fy, [], 'xData', x, 'yData', y);
title('1st order derivative in y-dir.');
subplot(2,3,4);
imshow(Fxx, [], 'xData', x, 'yData', y);
title('2nd order derivative in x-dir.');
subplot(2,3,5);
imshow(Fyy, [], 'xData', x, 'yData', y);
title('2nd order derivative in y-dir.');

%% 3.3

xx = -100:10:100;
yy = -100:10:100;
[XX, YY] = meshgrid(xx, yy);

A = 1; B = 2; V = 6*pi/201; W = 4*pi/201;
F = A * sin(V*X) + B * cos(W*Y);
Fx = A * V * cos(V * XX);
Fy = -B * W * sin(W * YY);

imshow(F, [], 'xData', x, 'yData', y);
hold on;
quiver(xx, yy, Fx, Fy, 'x');
hold off;

%% 3.4

xx = -100:10:100;
yy = -100:10:100;
[XX, YY] = meshgrid(xx, yy);

A = 1; B = 2; V = 6*pi/201; W = 4*pi/201;
F = A * sin(V*X) + B * cos(W*Y);
Gx = gD(F, 1, 1, 0);
Gy = gD(F, 1, 0, 1);

imshow(F, [], 'xData', x, 'yData', y);
hold on;
quiver(xx, yy, Gx, Gy, 'x');
hold off;

end


