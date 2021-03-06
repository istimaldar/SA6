clear;
disp('Введите данные для первой последовательности: ');
[mu, sigma, n, X] = normalRandom();
alpha = 0.1;
x = mean(X);
t = erfinv(1 - alpha / 2.);
delta = t * sigma / sqrt(n);
bottom_line = x - delta;
top_line = x + delta;
disp('Доверительный интервал: ');
fprintf('%d < alpha < %d\n', bottom_line, top_line);
disp('Введите данные для второй последовательности: ');
[~, ~, m, Y] = normalRandom(mu, sigma);
x_right = norminv(1 - (alpha / 2.));
x_left = -x_right;
y = mean(Y);
phi = (x - y) / sqrt((power(sigma, 2) / n) + (power(sigma, 2) / m));
disp('Проверка гипотезы о равенстве математических ожиданий двух генеральных совокупностей для известных дисперсий: ');
checkHypotesis(phi, x_left, x_right);
sx = (1 / (n - 1)) * sum(power(X - x, 2));
sy = (1 / (m - 1)) * sum(power(Y - y, 2));
phi = (x - y) / sqrt((1 / n + 1 / m) * ((n - 1) * sx + (m - 1) * sy) / (n + m - 2));
disp('Проверка гипотезы о равенстве математических ожиданий двух генеральных совокупностей для неизвестных дисперсий: ');
checkHypotesis(phi, x_left, x_right);