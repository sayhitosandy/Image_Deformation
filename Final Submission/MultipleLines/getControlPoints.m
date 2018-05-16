function [sourcePoints,destPoints]=getControlPoints(img1Name,img2Name, newSize)

    image1=imresize(imread(img1Name), [newSize(1) newSize(2)]);
    image2=imresize(imread(img2Name), [newSize(1) newSize(2)]);
    
    [source,dest]=cpselect(image1,image2,'Wait',true);

    totalPoints=size(source,1);

    sourcePoints=[];
    for i=1:+2:totalPoints
        sourcePoints=[sourcePoints; round(source(i,2)) round(source(i,1)) round(source(i+1,2)) round(source(i+1,1));]  ;
    end

    destPoints=[];
    for i=1:+2:totalPoints
        destPoints=[destPoints; round(dest(i,2)) round(dest(i,1)) round(dest(i+1,2)) round(dest(i+1,1));]  ;
    end

end