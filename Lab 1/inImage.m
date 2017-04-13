%% Coordinates In Image Check
% Checks if point (x,y) falls inside image domain. Performs an
% additional check if 'linear' interpolation is used.
function boolean = inImage(s, x, y, interpolationMethod)

    boolean = (x <= s(2)) && (y <= s(1)) && (x >= 1) && (y >= 1);
    if strcmp(interpolationMethod, 'linear') && boolean
        boolean = inImage(s, (x+1), (y+1), '');
    end
end