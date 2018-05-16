
function [ destImage ] = crossDissolve( image1 , image2 ,frameNumber,totalFrames) 

% Resizing the images if necessary (Both the images should be equal in size) 
image2=imresize(image2,[size(image1,1) size(image2,2)]);


destImage=[];

            for row = 1:size(image1,1)
                for col = 1:size(image1,2)
                    p = double(image2(row,col,:));
                    q = double(image1(row,col,:));
                    destImage(row,col,:) = p +(1-frameNumber/totalFrames)*(q-p);
                end
            end
            
            
destImage=uint8(destImage)  ;
