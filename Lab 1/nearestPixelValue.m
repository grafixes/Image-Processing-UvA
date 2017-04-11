function nearest = nearestPixelValue(min, max, value)
    if (value >= min) && (value <= max)
        nearest = value;
    else
        if value < min
            nearest = min;
        else
            nearest = max;
        end
     end
end