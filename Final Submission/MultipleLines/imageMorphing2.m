% ---------------- NOTE---------------------------
% these(***) the begining as well as end of a verbal comment 

clc
close all
clear all

img1Name='try_sandy_1.jpg'; % source image
img2Name='try_rishabh_1.jpg'; % destination image 
outputPrefix='rs';
newRowSize=149;     newColSize=97;   

% newSize takes the dimesions for resizing the input images
newSize=[ newRowSize ; newColSize ] ; 

total_output_images=10; % excluding the first source image

% -------------SELECT POINTS----------------------

[srcLines,destLines]=getControlPoints(img1Name,img2Name,newSize);

% ***remove below to see source Lines*** 
srcLines  
% ***remove below to see destination Lines***
destLines 

% -------------SELECT POINTS----------------------



% -------------FIXED POINTS----------------------

% P1d = [80 10];
% Q1d = [20 10];
% P2d = [80 80];
% Q2d = [20 80];
% 
% P1 = [80 10];
% Q1 = [20 10];
% P2 = [80 60];
% Q2 = [20 60];
% 
% srcLines = [P1d Q1d; P2d Q2d];
% destLines = [P1 Q1; P2 Q2];
% 
% -------------FIXED POINTS----------------------


% no of rows in srcLines gives the total number of lines (see the FIXED POINTS above to see the values of srcLines) 
total_lines=size(srcLines,1);

%-----------new_lines----------
% In new_lines, the value at ( ***line number*** , : , 1) is the actual source line 
% values at (( ***line number*** , : ,i) where 1< i <= ***last i value*** are the interpolated lines
% values at ( ***line number*** , : , 11 or ***last value of i*** ) is the actual destination line 
new_lines=[];

interpolated_points=total_output_images-1;

% +2 for the beginning and ending points
total_points= interpolated_points+2; 

for lineNo = 1: total_lines
    
    fprintf('Source Line %d:',lineNo);
    srcLines(lineNo,:)
    
    fprintf('Destination Line %d:',lineNo);
    destLines(lineNo,:)
    
    interpolatedLineSet=interpLines( srcLines(lineNo,:) , destLines(lineNo,:) , total_points );
%     interLineSet

    for temp= 1:total_points
        new_lines(lineNo,:,temp)=interpolatedLineSet(temp,:);
    end
    
end


total_interpolated_lines=total_points; 

img1_source_line_matrix=new_lines(:,:,1);

% img2_source_line_matrix is actually same as ***image 1 destination line matrix***
img2_source_line_matrix=new_lines(:,:,total_interpolated_lines);

% since we already considered first one as source line matrix so i starts from 2
for i=2:total_interpolated_lines   
    dest_line_matrix=new_lines(:,:,i);
    
    img1_interpolated=multiLineMorph(img1Name,img1_source_line_matrix,dest_line_matrix,total_lines,i-1,newSize);
    img2_interpolated=multiLineMorph(img2Name,img2_source_line_matrix,dest_line_matrix,total_lines,i-1,newSize);

    finalImg=crossDissolve(img1_interpolated,img2_interpolated,i-1,total_output_images);
   
    
%   entering a new folder "Outputs" for saving outputs
%   change the forward slash to backward slash below in WINDOWS   
    oldFolder=cd ('./Outputs');
    
    figure;
    fig=imshow(finalImg);
    filename=strcat(outputPrefix,num2str(i),'.jpg');

    %      
%     %--------------SHOW LINES TOO------------------
%     hold on;
%     for l = 1:total_lines
%         Pi = [dest_line_matrix(l,1) ; dest_line_matrix(l,2)];
%         Qi = [dest_line_matrix(l,3) ; dest_line_matrix(l,4)];
%         x=[Pi(2),Qi(2)];
%         y=[Pi(1), Qi(1)];
% 
%         line( x , y , 'Color', 'yellow');
%     end
%     hold off;
% 
%     saveas(fig,filename);
%     %--------------SHOW LINES TOO END------------------
                    

        %`````````````` OR``````````````
 
        
%     --------------ONLY SAVE IMAGES------------------
         imwrite(finalImg,filename);
%     --------------ONLY SAVE IMAGES------------------
    
       % exiting the outputs folder
       cd (oldFolder);

       close;
end
