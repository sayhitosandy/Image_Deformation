function [destIm] = singleLineMorph( filename,srcLine, destLine,newSize )

srcIm = imread(filename);
rows=newSize(1);
cols=newSize(2);
srcIm = imresize(srcIm,[rows cols]);

Pd = [srcLine(1,1);srcLine(1,2)];
Qd = [srcLine(2,1);srcLine(2,2)];
P = [destLine(1,1);destLine(1,2)];
Q = [destLine(2,1);destLine(2,2)];

figure;
imshow(srcIm);
hold on;
x = [Pd(2);Qd(2)];
y = [Pd(1);Qd(1)];
line(x,y,'Color','red');
hold off;

normPQ = norm(Q-P);
normPdQd = norm(Qd - Pd);

destIm = zeros(rows,cols,3,'uint8');
for i=1:rows
    for j=1:cols
        X = [i-1;j-1];
        u = calc_U(X, P, Q);
        v = calc_V(X, P, Q);
       
        Xd = round(calc_Xd(u, v, Pd, Qd));
        
        if (Xd(1)+1 <= 0 || Xd(1)+1 > rows || Xd(2)+1 <= 0 || Xd(2)+1 > cols)
            destIm(X(1)+1,X(2)+1,:) = 255;
        else
            destIm(X(1)+1,X(2)+1,:) = srcIm(Xd(1)+1,Xd(2)+1,:);
        end
    end
end

hold off;
figure;
imshow(destIm);
hold on;
x = [P(2);Q(2)];
y = [P(1);Q(1)];
line(x,y,'Color','green');
end