%% SEPARATE DATA
% Separates a given data set into two parts.
% Given:
%   train_n   -   the number of datapoints in the train set
function [train_set, test_set] = separate_data(data, train_n)
   
    train_set = data(1:train_n);
    test_set = data((train_n+1):numel(data));
end