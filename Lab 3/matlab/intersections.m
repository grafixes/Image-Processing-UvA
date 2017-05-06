%% INTERSECTIONS
function intersecs = intersections(imSize, lines)

    intersecs = [];
    for i = 1:length(lines)
        for j = 1+i:length(lines)
            intersec_pnt = cross(lines(i,:), lines(j,:));
            intersec_pnt = intersec_pnt/intersec_pnt(3);
            if intersec_pnt(1) > 0 && intersec_pnt(1) <= imSize(2) && ...
               intersec_pnt(2) > 0 && intersec_pnt(2) <= imSize(1)
                intersecs = [intersecs; intersec_pnt/intersec_pnt(3)];
            end
        end
    end
end