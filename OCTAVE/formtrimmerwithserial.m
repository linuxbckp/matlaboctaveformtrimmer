function outp=formtrimmerwithserial(inp,row,col)
%FORM TRIMMER WITH SERIAL
%TO TRIM(RE-SHAPE) INPUT MATRIX INTO A NEW SIZE OF OUTPUT MATRIX
%PARAM: inp INPUT MATRIX
%PARAM: row ROWS OF OUTPUT MATRIX
%PARAM: col COLUMNS OF OUTPUT MATRIX
if(isnan(inp))
    error('Invalid matrix. You need put in a meaningful matrix to use this program.');
end
if(isnan(row(1))||(row<1))
    error('Invalid row. You need put in a row number which is greater than 1 to use this program.');
end
if(isnan(col(1))||(col<1))
    error('Invalid column. You need put in a column number which is greater than 1 to use this program.');
end

%THIS PROGRAM SUPPORTS FLOAT ROW AND COLUMN NUMBERS, WHERE THE DECIMAL PART WILL BE DISCARDED
%BY THIS PROGRAM.
row=row(1)-mod(row(1),1);
col=col(1)-mod(col(1),1);
y2=zeros(col,row);
y3=zeros(col,row);
for i=1:(row*col)
    y2(i)=inp(i);
    y3(i)=i;
end
%y2=y2';
%y3=y3';
y4=zeros(row*2,col);
origincount=size(inp);
origincount=origincount(1)*origincount(2);
newcount=1;
for i=1:2*row*col
    y4(i)=NaN;
end
i3=1;
for i=1:(row*col)
    if(newcount>origincount)
        break;
    end
    i2=mod(i,col);
    if(i2==0)
        i2=col;
    end
    y4((2*i3-1),i2)=y3(i);
    y4((2*i3),i2)=y2(i);
    if(i2==col)
        i3+=1;
    end
    newcount+=1;
end
outp=y4;