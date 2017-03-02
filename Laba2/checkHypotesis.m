function [isTrue] = checkHypotesis(phi, x_left, x_right)
    isTrue = phi > x_left && phi < x_right;
    if isTrue
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
end