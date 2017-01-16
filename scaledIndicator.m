function indicatorfn = scaledIndicator(state,x,y)
%inputs:
% x is the size of the new grid in the x direction
%y is the size of the new grid in the y direction
%usage
%xind is the zero based x index of the state mapped to its position on
%x-axis
%yind is the zero based y index of the state mapped to its position on
%y-axis
%tile is the new state when the old state is maped to the original (smaller) grid
    xind = mod((state-1),x);
    yind = floor((state-1)/y);
    %use 5 because the current grid was scaled by 2x2 to get a the new 5x5 grid.
    tempx =floor(xind/2);
    tempy =floor(yind/2);
    tile = tempx + tempy + (5-1)*tempy;% (floor(yind/2)*2); 
    indicatorfn = zeros(25,1);
    indicatorfn(tile+1,1) = 1;
end