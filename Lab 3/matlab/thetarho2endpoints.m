%% THETARHO2ENDPOINTS
% NOTE:
% The drawing of the lines is not done inside this function. Displaying
% the returned result from houghlines can be done by using
% display_hough_lines().
function [x1, y1, x2, y2] = thetarho2endpoints(theta, rho, rows, cols)
    x1 = 0;
    x2 = cols;
    y1 = calc_y(x1, theta, rho);
    y2 = calc_y(x2, theta, rho);
    % Check if a line is nearing verticality.
    if abs(y2-y1) > cols
        y1 = 0;
        y2 = rows;
        x1 = calc_x(y1, theta, rho);
        x2 = calc_x(y2, theta, rho);
    end
end

function y = calc_y(x, theta, rho)
    y = (x*sin(theta)-rho) / cos(theta);
end

function x = calc_x(y, theta, rho)
    x = (rho+y*cos(theta)) / sin(theta);
end