# Matlab Octave Form Trimmer
Trim(reshape) A Form on Matlab or GNU Octave
### -
When you write an essay, you may put in some abnormal sized forms(e.g. a 1x100 form). In this time you can use this software to transform it to a form with a size of 5x20.
### -
# To trim(reshape) an input 2D matrix into any size of 2D matrix.
formtrimmer.m: simply trim.
formtrimmerwithhead.m: trim and add a table head on top or left.
formtrimmerwithserial.m: trim and add a serial for every block.
formtrimmerwithserialwithhead.m: trim and add a serial for every block, then add a table head on top or left.
# Usage:
formtrimmer(input,row,column)
formtrimmerwithhead(input,row,column,tableHeadName,tableHeadPlaceFlag)
formtrimmerwithserial(input,row,column)
formtrimmerwithserialwithhead(input,row,column,tableHeadName,tableHeadPlaceFlag)
