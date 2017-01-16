function [newLocation,successfulMove] = attemptMove(grdLocation,action,grdsize)
    successfulMove = false;
    %try to go left
    if action == 3 &&  mod(grdLocation,grdsize) == 1
        newLocation = grdLocation;
       
    %try to go down
    elseif action == 2 && grdLocation <= grdsize
        newLocation = grdLocation;
        
    %try to go right
    elseif action == 4 && mod(grdLocation,grdsize) == 0
        newLocation = grdLocation;
        
    %try to go up
    elseif action == 1 && grdLocation > (grdsize-1)*grdsize
        newLocation = grdLocation;        
    else          
        if action == 1
            newLocation = grdLocation + grdsize;
        elseif action == 2
            newLocation = grdLocation - grdsize;
        elseif action == 3
            newLocation = grdLocation - 1;
        else 
            newLocation = grdLocation + 1;
        end   
        successfulMove = true;
    end
end