function [results, pval, data] = compRowFreqDisAtValue(xval,xchoice,yval,ychoice,val); 
%accepts two pairs of matrixes with equal n. rows and a value
%cross references xval with xchoice to determine the frequency distribution
%of values below a threshold determined by val


xFreqDist = paycutCheck(xval,xchoice,val);
yFreqDist = paycutCheck(yval,ychoice,val);


[results, pval] = kstest2(xFreqDist, yFreqDist);
data = [xFreqDist,yFreqDist];

end

function [freqDist,RowCount,groupResults] = paycutCheck(objChoicevalues,choices,value)
%check to see standard deviation, mean, number of risky choices over, under, and equal to $2 

x = objChoicevalues;
y = choices;
fv = value;                                                                               %threshold value

sizex = size(x);                                                                       %est. matrix dimensions
%results = [strcat('+', num2str(fv)),strcat('-', num2str(fv)),strcat('+', num2str(fv)  %returns the number of times

%est new variables
groupResults = [0 0 0];                                                                 %fv meets the criteria specified
RowCount = zeros(sizex(1),1);                                                           %returns cumulative value of criterion met (specified by fv) at row(i)
riskyChoices = zeros(1, 1929);                                  
recoded = [];

for i = 1:sizex(1)     %rows
for ii = 1:sizex(2)    %columns
    
    if (x(i,ii) > fv) && (y(i,ii) == 1);                     % val > 2
        groupResults(1) = groupResults(1) + 1;
        riskyChoices(i,ii) = x(i,ii);
        
        recoded(i,ii) = 0;
        
    else if (x(i,ii) < fv) && (y(i,ii) == 1);               % val < 2
        groupResults(2) = groupResults(2) + 1;
        RowCount(i) = RowCount(i) + 1;
        riskyChoices(i,ii) = x(i,ii);
        
        recoded(i,ii) = 1;
        
        
    else if (x(i,ii) == fv) && (y(i,ii) == 1);              % val = 2
        groupResults(3) = groupResults(3) + 1;
        riskyChoices(i,ii) = x(i,ii);
        RowCount(i) = RowCount(i) + 1;
       
        recoded(i,ii) = 1;
        
        end
        end
    end
    
        

end
end

freqDist = RowCount ./ sizex(2); 
end