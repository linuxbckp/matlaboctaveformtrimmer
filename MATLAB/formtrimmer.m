function outp=formtrimmer(inp,row,col)
%FORM TRIMMER
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
origincount=size(inp);
origincount=origincount(1)*origincount(2);
newcount=1;
for i=1:(row*col)
    y2(i)=NaN;
end
for i=1:(row*col)
    if(newcount>origincount)
        break;
    end
    y2(i)=inp(i);
    newcount=newcount+1;
end
outp=y2';
