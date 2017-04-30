function gauss = Gauss1(sigma)

% choose range
M = 2 * sigma;
X = -M:M;

% calculate Gaussian 
gauss = exp(-X.^2/(2*sigma^2));
gauss=gauss./sum(gauss(:));

end