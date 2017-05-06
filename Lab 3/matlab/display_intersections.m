%% DISPLAY INTERSECTIONS
function display_intersections(intersecs, img, name)
    figure('name', name);
    imshow(img);
    hold on
    for i = 1:length(intersecs)
        if intersecs(i, 1) > 0
            plot(intersecs(i, 1), intersecs(i, 2), 'r+');
        end
    end
    hold off
end