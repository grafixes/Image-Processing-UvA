%% MINUS MEAN
function X = minus_mean(X)

    [M, ~] = size(X);

    % subtract off the mean for each dimension
    mn = mean(X, 1);
    X = X - repmat(mn, M, 1);
end