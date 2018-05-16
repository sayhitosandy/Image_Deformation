clc
close all

srcImg=imread('1.jpg');
srcImg=rgb2gray(srcImg);
destImg=imread('2.jpg');
destImg=rgb2gray(destImg);
 
% Resizing the images if necessary(Both the images should be equal in size) 
destImg=imresize(destImg,[size(srcImg,1) size(srcImg,2)]);

n=50; %No. of iterations
for i = 1:n
    im3 = intermediate(srcImg, destImg, n, i);
    imshow(uint8(im3))
    
    if (i == 17)
        imwrite(uint8(im3), 'im1.jpg');
    end
    if (i == 35)
        imwrite(uint8(im3), 'im2.jpg');
    end
    pause(0.1)
end

intermediate(srcImg,destImg,n,i);