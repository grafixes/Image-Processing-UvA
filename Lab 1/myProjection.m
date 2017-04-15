%% Projective Transformation
function projection = myProjection(image, x1, y1, x2, y2, ...
                      x3, y3, x4, y4, m, n, method)

    % allocate new image of correct size
    projection = zeros(n, m);
    % 4x2 matrix of input points
    xy = [x1, y1;
          x2, y2;
          x3, y3;
          x4, y4];
    % 4x2 matrix of corresponding output points
    uv = [1, 1;
          n, 1;
          n, m;
          1, m];
    M = createProjectionMatrix(uv, xy);
    numberOfIndices = m*n;
    [XI, YI] = meshgrid(1:n, 1:m);
    indices = [XI(:)'; YI(:)'; ones(1, numberOfIndices)];
    transformedIndices = M * indices;
    % creates a vector filled with the lambdas
    lambdas = transformedIndices(3, :);
    % divides the transformed indices with the corresponding lambdas
    transformedIndices = transformedIndices ./ lambdas;
    
    for i = 1:numberOfIndices
        projection(indices(1, i), indices(2, i)) = pixelValue(image, ...
            transformedIndices(2, i), transformedIndices(1, i), method);
    end
end