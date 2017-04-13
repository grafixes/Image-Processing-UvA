%% Image Rotation
% Performs a rotation transformation with a 
% specified angle on a provided image around
% its center.
function rotatedImage = rotateImage(image, angle, interpolationMethod)
    
    [m, n] = size(image);
    phi = deg2rad(angle);
    center = round(size(image)/2);
    numberOfIndices = m*n;
    
    R = rot(phi);
    [X, Y] = meshgrid(1:n, 1:m);
    indices = [X(:)'; Y(:)'; ones(1, numberOfIndices)];
    
    rotatedIndices = trans(center) * (R * (trans(-center) * indices));
    rotatedImage = zeros(m, n);
    
    for i = 1:numberOfIndices
        rotatedImage(indices(2, i), indices(1, i)) = pixelValue(image, ...
            rotatedIndices(1, i), rotatedIndices(2, i), interpolationMethod);
    end
end