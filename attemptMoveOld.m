function [newLocation,successfulMove] = attemptMove(grdLocation,action)
    successfulMove = false;
    %try to go left
    if action == 3 && ~isempty(find(grdLocation == [1 6 11 16 21],1)) 
        newLocation = grdLocation;
       
    %try to go down
    elseif action == 2 && ~isempty(find(grdLocation == [1 2 3 4 5],1))
        newLocation = grdLocation;
        
    %try to go right
    elseif action == 4 && ~isempty(find(grdLocation == [5 10 15 20 25],1)) 
        newLocation = grdLocation;
        
    %try to go up
    elseif action == 1 && ~isempty(find(grdLocation == [21 22 23 24 25],1))
        newLocation = grdLocation;        
    else          
        if action == 1
            newLocation = grdLocation + 5;
        elseif action == 2
            newLocation = grdLocation - 5;
        elseif action == 3
            newLocation = grdLocation - 1;
        else 
            newLocation = grdLocation + 1;
        end   
        successfulMove = true;
    end
end