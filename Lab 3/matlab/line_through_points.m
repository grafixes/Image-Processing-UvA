%% LINE THROUGH POINTS
% returns:
%   l   - homogeneous representation of the least-square-fit
function l = line_through_points(points)

    centroid = mean(points);
    % Compute a set of vectors p_i - centroid
    p = points - repmat(centroid, length(points), 1);
    % Calculate the direction vector u
    [u, ~] = eigs(cov(points), 1);
    % Calculate the line vector
    l = cross([centroid, 1], [centroid+u', 1]);
end