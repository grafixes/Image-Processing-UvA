%% Principal Component Analysis
% Given:
%   X       -   MxN matrix of input data
%               (M trials, N dimensions)
%   k       -   number of largest magnitude eigenvalues
%
% Returns:
%   signals -   MxN matrix of projected data
%   PC      -   each column is a PC
%   V       -   Mx1 matrix of variances
function [signals, PC, V] = pca(X, k)

    [~, N] = size(X);

    % subtract off the mean for each dimension
    X = minus_mean(X);
    
    % calculate the covariance matrix
    C = 1 / (N-1) * X * X';
    
    % calculate the diagonal matrix V of eigenvalues
    % and matrix PC whose columns are the 
    % corresponding right eigenvectors
    [PC, V] = eigs(C, k);
    
    % extract diagonal of matrix of eigenvalues as vector
    V = diag(V);
    
    % project the original data set
    signals = PC' * X;
end