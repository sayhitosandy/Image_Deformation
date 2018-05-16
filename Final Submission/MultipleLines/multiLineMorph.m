function [ destIm ] = multiLineMorph( image ,srcLines , destLines , nLines , frameNumber , newSize)
    srcIm = imread(image);
    
    rows = newSize(1);
    cols = newSize(2);

    srcIm = imresize(srcIm,[rows cols]);

    destIm = zeros(rows,cols,3,'uint8');

    for iter1 = 1:rows
        for iter2 = 1:cols
            X = [iter1-1; iter2-1];
            DSUM = [0 0];
            weightsum = 0;

            p = 0;
            a = 1;
            b = 2;

            for i = 1:nLines
                Pi = [destLines(i,1); destLines(i,2)];
                Qi = [destLines(i,3); destLines(i,4)];

                Pdi = [srcLines(i,1); srcLines(i,2)];
                Qdi = [srcLines(i,3); srcLines(i,4)];

                u = calc_U(X, Pi, Qi);

                v = calc_V(X, Pi, Qi);

                Xdi = round(calc_Xd(u, v, Pdi, Qdi));

                Di = Xdi - X;

                dist = findDist(X, u, v, Pi, Qi);

                length = norm(Pi-Qi);

                weight = ((length^p) / (a + dist))^b;

                DSUM = DSUM + (Di*weight);

                weightsum = weightsum + weight;
            end

            Xd = round(X + (DSUM/weightsum));

            if (Xd(1)+1 <= 0 || Xd(1)+1 > rows || Xd(2)+1 <= 0 || Xd(2)+1 > cols)
                destIm(X(1)+1,X(2)+1,:) = 255;
            else
                destIm(X(1)+1,X(2)+1,:) = srcIm(Xd(1)+1,Xd(2)+1,:);
            end

        end
    end
end