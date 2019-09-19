file1 = dir('*.set');

x1 = EEG.data(7,:).';
x2 = EEG.data(31,:).';
x3 = EEG.data(55,:).';
x4 = EEG.data(80,:).';
x5 = EEG.data(106,:).';
y = EEG.data(129,:).';

%x1.*x2 x1.*x3 x1.*x4 x1.*x5 x2.*x3 x2.*x4 x2.*x5 x3.*x4 x3.*x5 x4.*x5
%X = [ones(size(x1)) x1 x2 x3 x4 x5];
X = [x1 x2 x3 x4 x5];
%[b,bint,r,rint,stats] = regress(y,X);
mdl = fitlm(X,y);
xn = table2array (mdl.Coefficients(1:6,1));

y0 = xn(1) + x1*xn(2) + x2*xn(3) + x3*xn(4) + x4*xn(5) + x5*xn(6);
% y1 = xn(1) + x1*xn(2) + x2*xn(3) + x3*xn(4) + x4*xn(5) + x5*xn(6);
% y2 = xn(1) + x1*xn(2) + x2*xn(3) + x3*xn(4) + x4*xn(5) + x5*xn(6);
% y3 = xn(1) + x1*xn(2) + x2*xn(3) + x3*xn(4) + x4*xn(5) + x5*xn(6);
% y4 = xn(1) + x1*xn(2) + x2*xn(3) + x3*xn(4) + x4*xn(5) + x5*xn(6);
% y5 = xn(1) + x1*xn(2) + x2*xn(3) + x3*xn(4) + x4*xn(5) + x5*xn(6);

EEG.data(129,:) = y0.';
% scatter3(x1,x2,y,'filled')
% hold on
% x1fit = min(x1):100:max(x1);
% x2fit = min(x2):10:max(x2);
% [X1FIT,X2FIT] = meshgrid(x1fit,x2fit);
% YFIT = b(1) + b(2)*X1FIT + b(3)*X2FIT + b(4)*X1FIT.*X2FIT;
% mesh(X1FIT,X2FIT,YFIT)
% xlabel('channel 55')
% ylabel('channel 7')
% zlabel('channel 129')
% view(50,10)
% hold off