
 %figure out size of table
%ranks cell against all values in its row

sz = size(x.Variables)
function [out] = orderFunction(x) 
sze = sz(1)*sz(2)
out = []

for i = 1 : sz(1)
    rank = []; %est. new arrays that get wiped on new i
    order = [];
                            
    [~, order] = sort(x{i,:}); %
    rank(order) = 1:numel(x{i,:});
    out(i,:) = rank;
end
end



    