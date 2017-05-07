%% LINE THROUGH POINTS
%
% Calculates the best line such l such that the sum of squared 
% distances of the data points pi = (xi,yi) to this line l are minimized.
%
% returns:
%   l   - homogeneous representation of the least-square-fit
function l = line_through_points(points)

    centroid = mean(points);
    % Compute a set of vectors pi - centroid
    p = points - repmat(centroid, length(points), 1);
    % Calculate the direction vector u
    [u, ~] = eigs(cov(points), 1);
    % Calculate the line vector
    l = cross([centroid, 1], [centroid+u', 1]);
end