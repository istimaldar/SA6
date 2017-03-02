function [mu, sigma, n, X] = normalRandom(mu, sigma, n)
    if (nargin < 3)
        n = input('Введите размер последовательности: ');
    end
    if (nargin < 2)
        sigma = input('Введите sigma: ');
    end
    if (nargin < 1)
        mu = input('Введите mu: ');
    end
    X = normrnd(ones(1, n) * mu , ones(1, n) * sigma);
end