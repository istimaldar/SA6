addpath 'c:\Users\istimaldar\Documents'
[RGB, gray, H, MX, SKV, moda, mediana] = loadImage('image.jpg');

[RGB2, gray2, H2, MX2, SKV2, moda2, mediana2] = loadImage('image2.jpg');

corrHist = corrcoef(H,H2);
gray1_res = imresize(gray,size(gray2));
corrImage = corr2(gray1_res,gray2);

R_only = RGB;
R_only (:,:,[2 3]) = 0;

G_only = RGB;
G_only (:,:,[1 3]) = 0;

B_only = RGB;
B_only (:,:,[1 2]) = 0;

RG_corr = corr2(R_only(:,:,1),G_only(:,:,2));
RB_corr = corr2(R_only(:,:,1),B_only(:,:,3));
GB_corr = corr2(G_only(:,:,2),B_only(:,:,3));


gray = im2double(gray);
gray2 = im2double(gray2);

grayVector = reshape(gray,[],1);
grayVector2 = reshape(gray2,[],1);

isHistNormalDist = chi2gof(grayVector);
isHistNormalDist2 = chi2gof(grayVector2);


fprintf('изображение 1 (геометрическое)\n');
fprintf('M(X) %d\n—р. вадр. «начение: %f\nмедиана: %f\nмода: %f',MX,SKV,mediana,moda);
fprintf('коррел€ци€ цветовых компонент:\nRG: %f GB: %f RB: %f\n',RG_corr,GB_corr,RB_corr);
if (isHistNormalDist == 1)
	fprintf('гипотеза о нормальном распределении подтверждена')
else
	fprintf('гипотеза о нормальном распределении опровергнута')
end
R_only = RGB2;
R_only (:,:,[2 3]) = 0;

G_only = RGB2;
G_only (:,:,[1 3]) = 0;

B_only = RGB2;
B_only (:,:,[1 2]) = 0;

RG_corr = corr2(R_only(:,:,1),G_only(:,:,2));
RB_corr = corr2(R_only(:,:,1),B_only(:,:,3));
GB_corr = corr2(G_only(:,:,2),B_only(:,:,3));


fprintf('\n\nизображение 2\n');
fprintf('M(X) %d\n—р. вадр. «начение: %f\nмедиана: %f\nмода: %f',MX2,SKV2,mediana2,moda2);
fprintf('коррел€ци€ цветовых компонент:\nRG: %f GB: %f RB: %f\n',RG_corr,GB_corr,RB_corr);
if (isHistNormalDist2 == 1)
	fprintf('гипотеза о нормальном распределении подтверждена')
else
	fprintf('гипотеза о нормальном распределении опровергнута')
end

fprintf('\nкоррел€ци€ изображений: %d\n',corrImage);
fprintf('\nкоррел€ци€ гистограмм: %d\n',corrHist(2));