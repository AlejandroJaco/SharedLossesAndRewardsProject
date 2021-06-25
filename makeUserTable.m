
%make and organize my own set of data
function [tblOut] = makeUserTable(x, y, z)
                            %x = {block, color, value, sharers, repeat} 
                            %y = choices
                            %z = logical 0 = self, 1 = shared;
                    
varNames = {'block', 'color', 'value', 'sharers', 'repeat', 'choice', 'vL', 'probFixed', 'probLottery', 'vF'};
varTypes = {'string', 'string', 'double', 'double', 'double', 'double', 'double', 'double', 'double', 'double'};
tblSz = [length(y(1,:)) 10];

for i = 1: length(y(:,1));                                                              %go through all participants/rows
    
    tbl = table('Size', tblSz, 'VariableTypes', varTypes, 'Variablenames', varNames);   %new table
    tbl.choice = transpose(y(i,:));                                                     %insert choices
    
    tbl.vF = repmat(2, length(y(1,:)), 1);                                              % assigning arrays of fixed values
    tbl.probFixed = repmat(1, length(y(1,:)), 1);
    tbl.probLottery = repmat(.5, length(y(1,:)), 1);

    
    for ii = 1: length(y(1,:)); %start double loop            
                                                           %assign the following values while in this loop
       tbl.color(ii) = x{i,ii}(2,1);
       tbl.value(ii) = str2double(x{i,ii}(3,1));
       tbl.sharers(ii) = str2double(x{i,ii}(4,1));
       tbl.repeat(ii) = str2double(x{i,ii}(5,1));
       
       if z;                                                                           %check block type before moving forward
           tbl.vL = tbl.value ./ tbl.sharers;
           tbl.block(ii) = 'shared';                                          
       else 
           tbl.vL = tbl.value;
           tbl.block(ii) = 'self';
       end
       
    end
    filename = strcat('subject', num2str(i), '.csv');
    writetable(tbl, filename);
end
end

           
       