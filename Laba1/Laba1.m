clear;
%---------This will upload data from excel---------------
%years = xlsread('UK Life expectation.xls', 'A8:A40');
%uk = xlsread('UK Life expectation.xls', 'B8:B40');
%england = xlsread('UK Life expectation.xls', 'C8:C40');
%--------------------------------------------------------
%---------This will upload data directly-----------------
years = string({'1980-1982', '1981-1983', '1982-1984', '1983-1985', '1984-1986', '1985-1987', '1986-1988', '1987-1989', '1988-1990', '1989-1991', '1990-1992', '1991-1993', '1992-1994', '1993-1995', '1994-1996', '1995-1997', '1996-1998', '1997-1999', '1998-2000', '1999-2001', '2000-2002', '2001-2003', '2002-2004', '2003-2005', '2004-2006', '2005-2007', '2006-2008', '2007-2009', '2008-2010', '2009-2011', '2010-2012', '2011-2013', '2012-2014'});
uk = [70.81, 71.06, 71.34, 71.54, 71.73, 71.91, 72.15, 72.41, 72.61, 72.86, 73.16, 73.36, 73.67, 73.83, 74.08, 74.24, 74.49, 74.73, 75.01, 75.32, 75.61, 75.85, 76.15, 76.5, 76.87, 77.14, 77.38, 77.68, 78.01, 78.41, 78.71, 78.91, 79.07];
england = [71.08, 71.32, 71.59, 71.59, 71.97, 72.15, 72.39, 72.65, 72.65, 73.08, 73.37, 73.59, 73.93, 74.1, 74.35, 74.51, 74.75, 75.0, 75.29, 75.61, 75.9, 76.13, 76.44, 76.79, 77.16, 77.46, 77.7, 78.0, 78.31, 78.71, 79.02, 79.21, 79.35];
%--------------------------------------------------------
for i = 1:length(years)
    a = strsplit(years(i), '-');
    years(i) = a(1);  
end
years = str2double(years);
clear a;
clear i;
regres = regress(uk.', [years; ones(1,length(years))].');
y = years * regres(1) + regres(2);
figure
subplot(2,1,1)
plot(years, uk, '.', years, y)
xlabel('Год')
ylabel('Продолжительность жизни')
title('UK')
regres = regress(england.', [years; ones(1,length(years))].');
y = years * regres(1) + regres(2);
subplot(2,1,2)
plot(years, england, '.', years, y)
xlabel('Год')
ylabel('Продолжительность жизни')
title('England')
disp('Коэффициенты корреляции: ');
R = corrcoef(years, uk);
fprintf('UK и года: %d\n', R(1,2))
R = corrcoef(years, england);
fprintf('England и года: %d\n', R(1,2))
R = corrcoef(uk, england);
fprintf('England и uk: %d\n', R(1,2))