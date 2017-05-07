%% OPTIMAL LINES ESTIMATION
% Uses the resulting lines (from houghlines) to select which points to 
% group into a line, and from those determines the best line using 
% a least-square-fit.
function lines = optimal_lines_estimation(img, Thresh, lines)

    % Perform edge detection
    [y, x] = find(edge(img, 'Canny', Thresh) > 0);
    
    for i = 1:size(lines, 1)
        % Select which points to group into a line
        pts = points_of_line([x, y], lines(i,:), 10);
        % Determine the best line using a least-square-fit
        lines(i,:) = line_through_points(pts);
    end
end