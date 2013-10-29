function output(obj, of)
% Perform output.
%
% $Id: output.m 40 2010-06-14 10:57:09Z ymishin $

% grids data
w = 'writemode'; a = 'append';
hdf5write(of, '/grids/reshl', obj.reshl, w, a);
if (obj.stokes.jmax > 1)
    mask = obj.stokes.mask;
else
    mask = 0;
end
hdf5write(of, '/grids/mask', uint8(mask), w, a);

end
