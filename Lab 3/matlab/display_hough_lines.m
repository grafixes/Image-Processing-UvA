%% DISPLAY HOUGH LINES
function display_hough_lines(lines, img, name)

    figure('name', name);
    imshow(img);
    hold on
    x1 = 0;
    x2 = size(img, 2);
    for i = 1:length(lines)
        line = lines(i,:);
        y1 = (-line(1)*x1-line(3))/line(2);
        y2 = (-line(1)*x2-line(3))/line(2);
        xy = [x1 y1; x2 y2];
        plot(xy(:,1), xy(:,2), 'Color', 'b');
    end
    hold off
end