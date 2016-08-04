
%outX,outY
%outX=[1];
%outY=[1];
x_len = 1200;
outX=zeros(length(Y),x_len);
outY=[];
for i = 1:length(Y)
    
    
    tt = X2(i);
    tmpX=1:x_len;
    for j = 1:x_len
        %tmpY(j)=Y(i);
        tmpX(j)= tt{1}(j);
    end
    size(tmpX)
    size(outX)
   outX(i,:)= tmpX;
    %outY=[outY;Y(i)];
end
    
    
        
        
        