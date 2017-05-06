%% HOUGHLINES
%
% Function takes an image and its Hough transform, finds the
% significant lines and draws them over the image
%
% Usage: houghlines(im, h, thresh)
%
% arguments:
%       im      - The original image
%       H       - Its Hough Transform
%       thresh  - The threshold level to use in the Hough Transform
%                 to decide whether an edge is significant
function [lines] = houghlines(im, H, thresh, dilate)
    
    [rows, cols] = size(im);
    rhomax = sqrt(rows^2 + cols^2);
    [nrho, ntheta] = size(H);
    drho = 2*rhomax/(nrho-1);
    dtheta = pi/ntheta;
    
    % Dilate the Hough Transform
    if dilate
        SE = strel('square', 2);
        H = imdilate(H, SE);
    end
    % Normalize the Hough Transform to range from 0 to 1
    H = normalize(H);
    % Threshold the Hough Transform for a value between 0 and 1
    H(H < thresh) = 0;
    % Form labeled connected components
    [L, nregions] = bwlabel(H);
    % Allocate the Nx3 matrix of homogeneous line coordinates
    lines = zeros(nregions, 3);
    
    for n = 1:nregions
        mask = L == n;      % Form a mask for each region.
        region = mask .* H; % Point-wise multiply mask by Hough Transform
                            % to give you an image with just one region of
                            % the Hough Transform.
        [M, I] = max(region);
        [~, maxcol] = max(M); % maxcol corresponds to thetaindex
        maxrow = I(maxcol);   % maxrow corresponds to rhoindex
        % Convert the indices back to theta and row values
        rho = (maxrow - (nrho/2)) * drho;
        theta = (maxcol-1) * dtheta;
        % Calculate the endpoints
        [x1, y1, x2, y2] = thetarho2endpoints(theta, rho, rows, cols);
        % Get the homogeneous line coordinates using the cross product
        hom_line_coords = cross([x1; y1; 1], [x2; y2; 1]);
        lines(n,:) = hom_line_coords ./ sqrt(hom_line_coords(1)^2 + ...
            hom_line_coords(2)^2);
    end
end