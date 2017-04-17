function [RGB, gray, H, MX, SKV, moda, mediana] = loadImage(adress)
    RGB = imread(adress);
    gray = rgb2gray(RGB);
    figure
    subplot(211); imshow(gray);
    H=imhist(gray,100);
    subplot(212); imhist(gray,100)
    MX = mean(H);
    SKV = sqrt(sum(H.^2)/length(H));
    moda = mode(H);
    mediana = median(H);
end