function gaussDer = gD(f, sigma, xorder, yorder)

    M = 2 * sigma;
    X = -M:M;
    G = Gauss1(sigma);
    Gx = G;
    Gy = G;

    if xorder == 1
        Gx = -(X./sigma^2).*G;
    end

    if xorder == 2
        Gx = ((X.^2./sigma^4)-(1/sigma^2)).*G;
    end

    if yorder == 1
        Gy = (-(X./sigma^2).*G);
    end

    if yorder == 2
        Gy = (((X.^2./sigma^4)-(1/sigma^2)).*G);
    end

    im = imfilter(Gx, Gy', 'conv', 'replicate');
    gaussder = imfilter(f, im, 'conv' ,'replicate');
    imshow(gaussder);
end

