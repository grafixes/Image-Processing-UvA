%% DATA MATRIX
% Constructs a matrix X, containing the data with size n by d
% with n the number of datapoints and d the number of data 
% dimensions (16800 for our vectorized images).
function X = data_matrix(data)
    
    d = numel(data{1}.img);
    n = numel(data);
    X = zeros(n, d);
    for i = 1:n
        datapoint = reshape(data{i}.img, 1, []);
        X(i, :) = datapoint;
    end
end