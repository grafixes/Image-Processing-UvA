%% HOUGH 
%
% Function takes a grey scale image, constructs an edge map by applying
% the Canny detector, and then constructs a Hough transform for finding
% lines in the image.
%
% Usage: h = hough(im, Thresh, nrho, ntheta)
%
% arguments:
%   im - The grey scale image to be transformed
%   Thresh - A 2 -vector giving the upper and lower
%            hysteresis threshold values for edge()
%   nrho - Number of quantised levels of rho to use
%   ntheta - Number of quantised levels of theta to use
%
% returns;
%   h - The Hough transform
function H = hough(im, Thresh, nrho, ntheta)

    BW = edge(im, 'Canny', Thresh); % built-in implementation
    [y, x] = find(BW);
    [rows, cols] = size(im);
    H = zeros(nrho, ntheta);
    
    rhomax = sqrt(rows^2 + cols^2); 
    drho = 2*rhomax/(nrho-1);
    dtheta = pi/ntheta;
    thetas = [0:dtheta:(pi-dtheta)];

    for i = [x';y']
        for theta = thetas
            rho = i(1) * sin(theta) - i(2) * cos(theta);
            rhoindex = round(rho/drho + nrho/2); 
            thetaindex = round(theta/dtheta + 1);
            H(rhoindex, thetaindex) = H(rhoindex, thetaindex) + 1;
        end
    end
end