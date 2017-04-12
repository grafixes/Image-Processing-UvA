%% Image Rotation
% Performs a rotation transformation with a 
% specified angle on a provided image around
% its center.
function rotatedImage = rotateImage(image, angle, interpolationMethod)
    
    imSize = size(image);
    phi = deg2rad(angle);
    center = round(imSize/2);    
    
    rotatedImage = zeros(imSize(1), imSize(2));
    indices = imageToIndices(image);
    
    invR = rot(phi, -center);
    invRotatedIndices = trans(center) * (invR * indices);
    
    for i=1:length(invRotatedIndices(1,:))
        origin = [invRotatedIndices(1,i), invRotatedIndices(2,i)]
        rotatedImage(indices(1,i), indices(2,i)) = pixelValue(image, ...
            origin(1), origin(2), interpolationMethod);       
    end
end