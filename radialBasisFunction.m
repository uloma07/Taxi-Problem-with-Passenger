function indicatorfn = radialBasisFunction(state,gridsize,sigma)
%inputs:
% x is the size of the new grid in the x direction
%y is the size of the new grid in the y direction
%usage
%xind is the zero based x index of the state mapped to its position on
%x-axis
%yind is the zero based y index of the state mapped to its position on
%y-axis
%tile is the new state when the old state is maped to the original (smaller) grid
    x= gridsize;
    y= gridsize;
    m = floor(gridsize/5);

    %get x and y indies of this state i its natural grid
    xind = mod((state-1),x);
    yind = floor((state-1)/y);
    
    %because the current grid was scaled by 2x2 to get a the new %grid. integer division
    %tempx =floor(xind/m);
    %tempy =floor(yind/m);
    
    %because the current grid was scaled by 2x2 to get a the new %grid. integer division
    floatx =floor(xind/m);
    floaty =floor(yind/m);
      
    %tile = tempx + tempy + (5-1)*tempy;% (floor(yind/2)*2); 
    funs = 1:25;
    funsx = mod((funs-1),5);
    funsy = floor((funs-1)/5);    
    indicatorfn = exp(-(1/(2*sigma^2)).*((funsx-floatx).^2 + (funsy-floaty).^2))./(2*pi*sigma^2);
    indicatorfn = indicatorfn';
end