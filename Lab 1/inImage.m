function boolean = inImage(s, x, y)
    % checks if point (x,y) falls inside image domain
    boolean = (x <= s(2)) && (y <= s(1)) && (x > 0) && (y > 0);
end