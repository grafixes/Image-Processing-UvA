%% Affine Transformation
% Performs an affine transformation on a provided image. The affine 
% transformation is derived from three provided input points.
function r = myAffine(image, x1, y1, x2, y2, x3, y3, m, n, method)

    % allocate new image of correct size
    r = zeros(n, m);
    % matrix containing input points
    A = [x1, x2, x3;
         y1, y2, y3;
         1, 1, 1];
    % matrix containing corresponding three output corner points
    B = [1, m, 1;
         1, 1, n];
    X = B / A;
    numberOfIndices = m*n;
    [XI, YI] = meshgrid(1:m, 1:n);
    indices = [XI(:)'; YI(:)'; ones(1, numberOfIndices)];
    transformedIndices = X * indices;
    
    for i = 1:numberOfIndices
        r(indices(2, i), indices(1, i)) = pixelValue(image, ...
            transformedIndices(2, i), transformedIndices(1, i), method);
    end
end