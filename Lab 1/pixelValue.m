%% Pixel Value at 
% Returns pixel value at specified (x,y) coordinates.
function color = pixelValue(image, x, y, interpolationMethod, borderMethod)
    
    % Set constant to be the default border method.
    if ~exist('borderMethod', 'var'), borderMethod = 'periodic'; end

    [m, n] = size(image);
    % check if coordinates are in image
    if ~inImage(size(image), x, y, interpolationMethod)
        switch (borderMethod)
            case 'constant'
                color = 0;
            case 'nearest'
                x = floor(valueInRange(1, n, x));
                y = floor(valueInRange(1, m, y));
                color = image(y, x);
            case 'periodic'
                if ~(x >= 1 && x <= n)
                    x = valueInRange(1, n, abs(abs(x) - n));
                end
                if ~(y >=1 && y <= m)
                    y = valueInRange(1, m, abs(abs(y) - m));
                end
                color = image(floor(y), floor(x));
        end
        return
    end
    
    switch (interpolationMethod)
        case 'nearest'
            color = image(floor(y + 0.5), floor(x + 0.5));
            return
        case 'linear'
            k = floor(y);
            a = y - k;
            l = floor(x);
            b = x - l;
            color = (1-a)*(1-b)*image(k,l) + (1-a)*b*image(k, l+1) ...
                    + a*b*image(k+1, l+1) + a*(1-b)*image(k+1, l);
            return
    end
end