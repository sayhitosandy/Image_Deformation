function [destIm] = SingleLine( srcLine, destLine )
srcIm = imread('triangle.jpg');
srcIm = rgb2gray(srcIm);
srcIm = imresize(srcIm,[300 300]);

% [x,y] = getpts;
% x(1) = 150;
% x(2) = 150;
% y(1) = 10;
% y(2) = 250;
Pd = [srcLine(1,1);srcLine(1,2)];
Qd = [srcLine(2,1);srcLine(2,2)];
P = [destLine(1,1);destLine(1,2)];
Q = [destLine(2,1);destLine(2,2)];

figure;
imshow(srcIm);
hold on;
x = [P(1);Q(1)];
y = [P(2);Q(2)];
line(x,y);

destIm = zeros(300,'uint8');
matr = zeros(300,6);
k = 1;
for i=1:300
    for j=1:300
        X = [i-1;j-1];
        u = calc_u(X, P, Q);
        v = calc_v(X, P, Q);
        Xd = round(calc_Xd(u, v, Pd, Qd));
        matr(k,1) = i;
        matr(k,2) = j;
        matr(k,3) = u;
        matr(k,4) = v;
        matr(k,5) = Xd(1);
        matr(k,6) = Xd(2);
        k=k+1;
        if (Xd(1)+1 <= 0 || Xd(1)+1 > 300 || Xd(2)+1 <= 0 || Xd(2)+1 > 300)
            destIm(X(1)+1,X(2)+1) = 255;
        else
            destIm(X(1)+1,X(2)+1) = srcIm(Xd(1)+1,Xd(2)+1);
        end
    end
end
figure;
imshow(destIm);
hold on;
x = [Pd(1);Qd(1)];
y = [Pd(2);Qd(2)];
line(x,y);
end