function [output] = plotTimelines(x,y)

yfit = [];
hold on
for i = 1 : length(x(:,1))%down the rows
    for ii = 1: length(x(1,:))%across the colums
        
        if ii == 1; %start at 6
            yfit(i,ii) = 6;
        else if (y(i,ii-1) < y(i,ii)); %if last node is smaller
            yfit(i,ii) = y(i,ii-1) + y(i,ii); %add them
        else
            yfit(i,ii) = y(i,ii-1) - y(i,ii); %subtract
            end
        end

    %plot (x(i,ii),y(i,ii),"d");
    plot (x(i,ii),yfit(i,ii));
    
    end
end
end


    