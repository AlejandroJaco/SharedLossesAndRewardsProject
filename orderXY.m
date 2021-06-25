%orders all colums of y by the indexes provided in x

sz = size(x.Variables)
function [out] = orderXY4me(x,y) 
sze = sz(1)*sz(2)
out = []

for i = 1 : sz(1)
    data = []; %est. new arrays that get wiped on new i
    order = [];
                            
    [~, order] = sort(x(i,:)); %
    data = y(i);
    DataSorted = data(order);
    out(i,:) = DataSorted;
end
end