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
%   H - The Hough transform
function H = hough(im, Thresh, nrho, ntheta)

    % Perform edge detection
    BW = edge(im, 'Canny', Thresh);
    [y, x] = find(BW);
    [rows, cols] = size(im);
    % Construct an empty accumulator array of size nrho * ntheta
    H = zeros(nrho, ntheta);
    
    rhomax = sqrt(rows^2 + cols^2);    % The maximum possible value of rho.
    drho = 2*rhomax/(nrho-1);          % The increment in rho between successive
                                       % entries in the accumulator matrix .
                                       % Remember we go between + - rhomax .
    dtheta = pi/ntheta;                % The increment in theta between entries .
    thetas = [0:dtheta:(pi - dtheta)]; % Array of theta values across the
                                       % accumulator matrix .
    
    % For each non-zero edge point (xi,yi) in the image we let the 
    % parameter θ equal each of the allowed discretized values of θ, 
    % and solve for the corresponding ρ.
    for i = [x';y']
        for theta = thetas
            rho = i(1) * sin(theta) - i(2) * cos(theta);
            rhoindex = round(rho/drho + nrho/2);
            thetaindex = round(theta/dtheta + 1);
            % Increment the entries of the accumulator array, corresponding
            % to the discretised ρ and θ values, by 1.
            H(rhoindex, thetaindex) = H(rhoindex, thetaindex) + 1;
        end
    end
end