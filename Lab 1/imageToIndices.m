function indices = imageToIndices(image)
    [m, n] = size(image);
    [X, Y] = meshgrid(1:n, 1:m);
    indices = [X(:) Y(:)]';
    indices = [indices; ones(1, length(indices))];
end