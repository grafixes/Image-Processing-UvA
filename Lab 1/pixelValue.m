function color = pixelValue(image, x, y, method, borderMethod)
    [m, n] = size(image);
    % check if coordinates are in image
    if ~inImage(size(image), x, y, method)
        switch (borderMethod)
            case 'constant'
                color = 0;
            case 'nearest'
                x = floor(nearestPixelValue(1, n, x));
                y = floor(nearestPixelValue(1, m, y));
                color = image(y, x);
            case 'periodic'
                color = 0;
        end
        return;
    end
    
    switch (method)
        case 'nearest'
            color = image(floor(y + 0.5), floor(x + 0.5));
            return;
        case 'linear'
            k = floor(x);
            l = floor(y);
            a = x - k;
            b = y - l;
            color = (1-a)*(1-b)*image(k,l) + (1-a)*b*image(k, l+1) ...
                    + a*b*image(k+1, l+1) + a*(1-b)*image(k+1, l);
            return;
    end
end