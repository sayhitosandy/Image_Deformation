% Code for Extracting the middle Images
function im3 = intermediate(srcImg, destImg, n, i)
    for row = 1:size(srcImg,1)
        for col = 1:size(destImg,2)
            p = double(destImg(row,col));
            q = double(srcImg(row,col));
            % The intermediate(im3) image is a combination of the Source Image and Destination Image        
            im3(row,col) = p +(1-i/n)*(q-p);
        end
    end
end