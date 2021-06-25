function [outputArg1] = orderxy4me(x,y)

outputArg1 = {}

for i = 1 : length(x(:,1))
    data = []; %est. new arrays that get wiped on new i
    nada = [];
    order = [];
    sortedData = [];
    
    sortme = x(i,:); %data order values for this column
    data = y;  %data for this column
    
    
    
    [nada, order] = sort(sortme); 
    sortedData = data(order);
    outputArg1(i,:) = sortedData;
end
end
