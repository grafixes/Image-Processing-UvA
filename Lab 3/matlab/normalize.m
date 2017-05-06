%% MATRIX NORMALIZATION
% Normalize matrix to range of [0, 1]
function result = normalize(input)
    range = max(max(input)) - min(min(input));
    result = (input - min(min(input))) / range;
end