function outp=formtrimmerwithhead(inp,row,col,th,th2)
%FORM TRIMMER WITH TABLE HEAD
%TO TRIM(RE-SHAPE) INPUT MATRIX INTO A NEW SIZE OF OUTPUT MATRIX
%PARAM: inp INPUT MATRIX
%PARAM: row ROWS OF OUTPUT MATRIX
%PARAM: col COLUMNS OF OUTPUT MATRIX
%PARAM: th TABLE HEAD IN MATRIX. EXAMPLE:["SERIAL,RESULT]
%PARAM: th2 PLACE TO PUT TABLE HEAD. 1 OR 't' MEANS PUT ON TOP, 2 OR
%'l' MEANS PUT ON LEFT.
if(isnan(inp))
    error('Invalid matrix. You need put in a meaningful matrix to use this program.');
end
if(isnan(row)||(row<1))
    error('Invalid row. You need put in a row number which is greater than 1 to use this program.');
end
if(isnan(col)||(row<1))
    error('Invalid column. You need put in a column number which is greater than 1 to use this program.');
end
if(th2~=1&&th2~='t'&&th2~=2&&th2~='l')
    error('Invalid place to put table head. 1 OR t MEANS PUT ON TOP, 2 OR l MEANS PUT ON LEFT.');
end

%THIS PROGRAM SUPPORTS FLOAT ROW AND COLUMN NUMBERS, WHERE THE FLOAT PART WILL BE DISCARDED
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
y2=y2';

if(th2==1||th2=='t')
    y3=zeros(row+1,col);
    for i=1:row
        for j=1:col
            y3(i+1,j)=y2(i,j);
        end
    end
    
    for j=1:col
        y3(1,j)=th(1);
    end
end

if(th2==2||th2=='l')
    y3=zeros(row,col+1);
    for i=1:row
        for j=1:col
            y3(i,j+1)=y2(i,j);
        end
    end
    
    for i=1:row
        y3(i,1)=th(1);
    end
end
outp=y3;