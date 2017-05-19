%% Principal Component Analysis
% Given:
%   X       -   MxN matrix of input data
%               (M trials, N dimensions)
%   d       -   number of largest magnitude eigenvalues
%
% Returns:
%   signals -   MxN matrix of projected data
%   PC      -   each column is a PC (eigenvector)
%   V       -   Mx1 matrix of variances
function [signals, PC, V] = pca(X, d)

    [~, N] = size(X);

    % subtract off the mean for each dimension
    X = minus_mean(X);
    
    % calculate the covariance matrix
    C = 1 / (N-1) * X * X';
    
    % calculate the diagonal matrix V of eigenvalues
    % and matrix PC whose columns are the 
    % corresponding right eigenvectors
    [PC, V] = eigs(C, d);
    
    % extract diagonal of matrix of eigenvalues as vector
    V = diag(V);
    
    % sort the variances in decreasing order
    [junk, rindices] = sort(-1*V);
    V  = V(rindices);
    PC = PC(:,rindices);
    
    % project the original data set
    signals = PC' * X;
end