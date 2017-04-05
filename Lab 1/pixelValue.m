function color = pixelValue(image, x, y, method)
    % check if coordinates are in image
    if ~inImage(size(image), x, y)
        % return a constant
    end
    
    switch (method)
        case 'nearest'
            color = image(floor(y + 0.5), floor(x + 0.5));
            return;
        case 'linear'
    end
end