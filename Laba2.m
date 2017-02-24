clear;
mu = 2;
sigma = 4;
n = 100;
X = sort(normrnd(ones(1, n) * mu , ones(1, n) * sigma));
alpha = 0.9;
x = mean(X);
t = erfinv(alpha / 2.);
delta = t * sigma / sqrt(n);
bottom_line = x - delta;
top_line = x + delta;
disp('Доверительный интервал: ');
fprintf('%d < alpha < %d\n', bottom_line, top_line);
m = 50;
Y = sort(normrnd(ones(1, m) * mu , ones(1, m) * sigma));
alpha = 0.1;
x_left = norminv(alpha);
x_right = -x_left;
y = mean(Y);
phi = (x - y) / sqrt((power(sigma, 2) / n) + (power(sigma, 2) / m));
disp('Проверка гипотезы о равенстве математических ожиданий двух генеральных совокупностей для известных дисперсий: ');
if phi > x_left && phi < x_right
    disp('Гипотеза подтверждена.');
    fprintf('%d < %d < %d\n', x_left, phi, x_right);
else
    disp('Гипотеза опровергнута.');
    if phi < x_left
        fprintf('%d < %d\n', phi, x_left);
    else
        fprintf('%d > %d\n', phi, x_right);
    end
end
sx = (1 / (n - 1)) * sum(power(X - x, 2));
sy = (1 / (m - 1)) * sum(power(Y - y, 2));
phi = (x - y) / sqrt((1 / n + 1 / m) * ((n - 1) * sx + (m - 1) * sy) / (n + m - 2));
disp('Проверка гипотезы о равенстве математических ожиданий двух генеральных совокупностей для неизвестных дисперсий: ');
if phi > x_left && phi < x_right
    disp('Гипотеза подтверждена.');
    fprintf('%d < %d < %d\n', x_left, phi, x_right);
else
    disp('Гипотеза опровергнута.');
    if phi < x_left
        fprintf('%d < %d\n', phi, x_left);
    else
        fprintf('%d > %d\n', phi, x_right);
    end
end