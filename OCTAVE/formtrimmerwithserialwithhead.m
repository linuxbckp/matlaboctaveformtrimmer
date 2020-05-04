 %   Matlab Octave Form Trimmer
 %   Copyright (C) 2020, LinuxBCKP
 %   This library is free software: you can redistribute it and/or modify
 %   it under the terms of the GNU General Public License as published by
 %   the Free Software Foundation, either version 3 of the License, or
 %   (at your option) any later version.

 %   This library is distributed in the hope that it will be useful,
 %   but WITHOUT ANY WARRANTY; without even the implied warranty of
 %   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 %   GNU General Public License for more details.

 %   You should have received a copy of the GNU General Public License
 %   along with this library.  If not, see <http://www.gnu.org/licenses/>.

 %   As a special exception, you may use this file as part of a free
 %   software library without restriction.  Specifically, if other files
 %   instantiate templates or use macros or inline functions from this
 %   file, or you compile this file and link it with other files to
 %   produce an executable, this file does not by itself cause the
 %   resulting executable to be covered by the GNU General Public
 %   License.  This exception does not however invalidate any other
 %   reasons why the executable file might be covered by the GNU General
 %   Public License.

function outp=formtrimmerwithserialwithhead(inp,row,col,th,th2)

%FORM TRIMMER WITH SERIAL WITH HEAD
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
if(isnan(row(1))||(row<1))
    error('Invalid row. You need put in a row number which is greater than 1 to use this program.');
end
if(isnan(col(1))||(col<1))
    error('Invalid column. You need put in a column number which is greater than 1 to use this program.');
end
if(th2~=1&&th2~='t'&&th2~=2&&th2~='l')
    error('Invalid place to put table head. 1 OR `t` MEANS PUT ON TOP, 2 OR `l` MEANS PUT ON LEFT.');
end
if(iscomplex(th)||ischar(th)||isstring(th))
    warning('TABLE HEAD NAME SHOULD BETTER BE A NUMBER.');
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

if(th2==1||th2=='t')
    y3=zeros(row*2+1,col);
    for i=1:row*2
        for j=1:col
            y3(i+1,j)=y4(i,j);
        end
    end
    
    for j=1:col
        y3(1,j)=th(1);
    end
end

if(th2==2||th2=='l')
    y3=zeros(row*2,col+1);
    for i=1:row*2
        for j=1:col
            y3(i,j+1)=y4(i,j);
        end
    end
    
    for i=1:row*2
        y3(i,1)=th(1);
    end
end
outp=y3;