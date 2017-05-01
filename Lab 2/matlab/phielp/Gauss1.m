function gauss = Gauss1(sigma)

% choose range
M = ceil(3 * sigma);
X = -M:M;

% calculate Gaussian 
gauss = exp(-X.^2 ./(2*sigma^2));
gauss = gauss ./ (sqrt(2*pi) * sigma);
gauss = (1/sum(gauss(:))) * gauss;

end