function output(obj, of)
% Perform output.
%
% $Id: output.m 38 2010-06-14 10:22:39Z ymishin $

% size of the domain
w = 'writemode'; a = 'append';
hdf5write(of, '/domain/size0', obj.size0, w, a);
hdf5write(of, '/domain/size', obj.size, w, a);

end
