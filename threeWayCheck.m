function [RowCount,AvailableCount] = threeWayCheck(objlotteryvals,choices,numSharers,value,n)
%check to see standard deviation, mean, number of risky choices over, under, and equal to $2 

%est. working variables
x = objlotteryvals;
y = choices;
z = numSharers;
fv = value;
n = n;
sizex = size(x);                        %est. matrix dimensions for easy reference                                                                                      

RowCount = zeros(sizex(1),1);           %returns cumulative value of criterion met (specified by numS and fv) at for all rows 
AvailableCount = zeros(sizex(1),1);     %returns cumulative value of all criterion available to be met

%est. loop
for i = 1:sizex(1)                       %rows
for ii = 1:sizex(2)                      %columns
    
    if (x(i,ii) > fv)                                                      %if above fv, skip. 
        continue
        
    else if (z(i,ii) ~= n)                                              %if not n, skip.
        continue
        
    else if (x(i,ii) == fv) && (y(i,ii) == 1) && (z(i,ii) == n)                              %if <= fv and n true, available.
            AvailableCount(i) = AvailableCount(i) + 1;
            RowCount(i) = RowCount(i)+ 1;
            %RowCount(i) = [RowCount(i) x(i,ii)];
             
    else if (x(i,ii) == fv) && (y(i,ii) == 0) && (z(i,ii) == n);          %if all are true, record.
            AvailableCount(i) = AvailableCount(i) + 1;
        
        end
        end
        end
    end
    
        

end
end
end




