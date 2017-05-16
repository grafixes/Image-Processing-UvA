%% MOSAIC
function mosaic(fileName1, fileName2, minData, iterationTimes, ...
                error, inliersTreshold) 
            
    f1 = imread(fileName1);
    f2 = imread(fileName2);
    img1 = single(rgb2gray(imread(fileName1)));
    img2 = single(rgb2gray(imread(fileName2)));
    
    [F1, D1] = vl_sift(img1);
    [F2, D2] = vl_sift(img2);
    
    matches = vl_ubcmatch(D1, D2);
    matrix = ransac(matches, F1, F2, minData, iterationTimes, error, ...
        inliersTreshold);
    T = maketform('projective', matrix');
    
    [x y] = tformfwd(T,[1 size(f1,2)], [1 size(f1,1)]);
    
    xdata = [min(1,x(1)) max(size(f2,2),x(2))];
    ydata = [min(1,y(1)) max(size(f2,1),y(2))];
    f12 = imtransform(f1,T,'Xdata',xdata,'YData',ydata);
    f22 = imtransform(f2, maketform('affine', [1 0 0; 0 1 0; 0 0 1]), ...
        'Xdata',xdata,'YData',ydata);
    
    figure
    subplot(2,2,1)
    imshow(f1);
    title('Picture 1');
    subplot(2,2,2)
    imshow(f2);
    title('Picture 2');
    subplot(2,2,3)
    imshow(max(f12,f22));
    title('Mosaic');
end