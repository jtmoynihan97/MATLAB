% Jake's Easy 1-D Interpolation

% This function accepts a 1-dimensional input vector as well as a
% 'numPoints' argument, and returns the input vector interpolated linearly
% to match the dimension specified by 'numPoints'.
%
% Not all interpolation points in the interpolated output vector will be
% uniformly spaced.

function vector_interp = easyInterp1(vector,N)
    
    indices_original = linspace(1,length(vector),length(vector));
    indices_interp = linspace(1,length(vector),N);
    vector_interp = interp1(indices_original,vector,indices_interp,'linear');
    
end