function gauss = Gauss(sigma)

% choose range
M = ceil(3 * sigma);
N = ceil(3 * sigma);
x = -M:M;
y = -N:N;

% create sampling grid
[X, Y] = meshgrid(x, y);

% calculate Gaussian 
gauss = exp(-X.^2 ./(2*sigma^2)-Y.^2/(2*sigma^2));
gauss = gauss./ (2*pi*sigma)^2;
gauss = (1/sum(gauss(:))) * gauss;

end