%% POINTS OF LINE
%
% Collects the points close to a line found by the Hough transform, 
% within a distance of epsilon.
%
% arguments:
%   points  - an array containing all points
%   line    - the homogeneous representation of the line
%   epsilon - the maximum distance
% returns:
%   pts     - an array of all points within epsilon of the line
function [pts] = points_of_line(points, line, epsilon)
    % Convert to homogeneous coordinates.
    hom_points = [points'; ones(1, length(points))];
    % Find the points that lie in a maximum distance of epsilon.
    pts = find(abs(line*hom_points) <= epsilon);
    pts = points(pts, :);
end