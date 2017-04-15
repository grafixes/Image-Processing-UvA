%% Projective Transformation
function projection = myProjection(image, x1, y1, x2, y2, ...
                      x3, y3, x4, y4, m, n, method)
    
    % allocate new image of correct size
    projection = zeros(n, m);
    % 4x2 matrix of input points
    xy = [x1, x2, x3, x4;
          y1, y2, y3, y4]';
    % 4x2 matrix of corresponding output points
    uv = [1, m, 1, m;
          1, 1, n, n]';
    M = createProjectionMatrix(xy, uv);
    
    for xIndex = 1:m
        for yIndex = 1:n
            % calculate x and y
            projection(yIndex , xIndex) = ...
                pixelValue(image, x, y, method);
        end
    end
end