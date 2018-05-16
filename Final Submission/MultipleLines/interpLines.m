function [ interpLinesSet ] = interpLines( srcLine, destLine, totalLines)
    
%   totalLines already considers the starting and ending lines  
        interpLinesSet=[];
    
        x1_source=srcLine(1,1);
        y1_source=srcLine(1,2);
        x2_source=srcLine(1,3);
        y2_source=srcLine(1,4);
        
        x1_dest=destLine(1,1);
        y1_dest=destLine(1,2);
        x2_dest=destLine(1,3);
        y2_dest=destLine(1,4);
        
        x1_interpolated=linspace(x1_source,x1_dest,totalLines);
        y1_interpolated=linspace(y1_source,y1_dest,totalLines);
        x2_interpolated=linspace(x2_source,x2_dest,totalLines);
        y2_interpolated=linspace(y2_source,y2_dest,totalLines);
        
       for lineNo=1:totalLines
                interpLinesSet=[ interpLinesSet ; x1_interpolated(lineNo) y1_interpolated(lineNo) x2_interpolated(lineNo) y2_interpolated(lineNo) ; ];
       end
       
       interpLinesSet
end