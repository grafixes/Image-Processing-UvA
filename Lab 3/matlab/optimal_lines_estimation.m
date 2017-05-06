%% OPTIMAL LINES ESTIMATION
function lines = optimal_lines_estimation(img, Thresh, lines)

    [y, x] = find(edge(img, 'Canny', Thresh) > 0);
    
    for i = 1:size(lines, 1)
        pts = points_of_line([x, y], lines(i,:), 10);
        lines(i,:) = line_through_points(pts);
    end
end