function [freqDist,recoded,groupResults,RowCount] = paycutCheck(objChoicevalues,choices,fv,opref)
%check to see standard deviation, mean, number of risky choices over, under, and equal to $2 

x = objChoicevalues;
y = choices;
fv = fv;
xx = opref;

sizex = size(x);                                                                       %est. matrix dimensions
%results = [strcat('+', num2str(fv)),strcat('-', num2str(fv)),strcat('+', num2str(fv)  %returns the number of times
groupResults = [0 0 0];                                                                 %fv meets the criteria specified
                                                                                       
RowCount = zeros(sizex(1),1);                                                           %returns cumulative value of criterion met (specified by fv) at row(i)

riskyChoices = zeros(1, 1929);                                  

recoded = [];

for i = 1:sizex(1)     %rows
for ii = 1:sizex(2)    %columns
    
    if (x(i,ii) > fv) && (y(i,ii) == 1);                     % x > 2
        groupResults(1) = groupResults(1) + 1;
        riskyChoices(i,ii) = x(i,ii);
        
        recoded(i,ii) = 0;
        
    else if (x(i,ii) < fv) && (y(i,ii) == 1);               % x < 2
        groupResults(2) = groupResults(2) + 1;
        RowCount(i) = RowCount(i) + 1;
        riskyChoices(i,ii) = x(i,ii);
        
        recoded(i,ii) = xx(i,ii);
        
        
    else if (x(i,ii) == fv) && (y(i,ii) == 1);              % x = 2
        groupResults(3) = groupResults(3) + 1;
        riskyChoices(i,ii) = x(i,ii);
        RowCount(i) = RowCount(i) + 1;
        
        recoded(i,ii) = xx(i,ii);
        
        end
        end
    end
    
        

end
end

freqDist = RowCount ./ sizex(2); 
end



