%% Adds Border to Image
% Calculates the new dimension after a rotation of a specified angle.
% Positions the original image in the center of this new dimension.
function borderedImage = borderImage(image, angle)

    [height, width] = size(image);
    angle = abs(angle);
    newWidth = abs(height * cos(angle) + width * sin(angle));
    newHeight = abs(height * sin(angle) + width * cos(angle));
    
    topMargin = ceil((newWidth - width) / 2);
    leftMargin = ceil((newHeight - height) / 2);
    newWidth = width + leftMargin*2;
    newHeight = height + topMargin*2;
    
    borderedImage = zeros(newHeight, newWidth);
    borderedImage(topMargin+1:(newHeight-topMargin), ...
        leftMargin+1:(newWidth-leftMargin)) = image;
end