function gauss = Gauss(sigma)

% choose range
M = 2 * sigma;
N = 2 * sigma;
x = -M:M;
y = -N:N;

% create sampling grid
[X, Y] = meshgrid(x, y);

% calculate Gaussian 
gauss = exp(-X.^2/(2*sigma^2)-Y.^2/(2*sigma^2));
gauss=gauss./sum(gauss(:));

end