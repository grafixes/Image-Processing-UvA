%% MINUS MEAN
function X = minus_mean(X)

    [~, N] = size(X);

    % subtract off the mean for each dimension
    mn = mean(X, 2);
    X = X - repmat(mn, 1, N);
end