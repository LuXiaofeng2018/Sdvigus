function init(obj, df, cf)
% Read input files and perform initialization.
%
% $Id: init.m 38 2010-06-14 10:22:39Z ymishin $

% process data file
obj.size0 = hdf5read(df, '/domain/size0');
obj.size = hdf5read(df, '/domain/size');

% boundary conditions
obj.stokes_bc = StokesBC();
obj.stokes_bc.init(df, cf);

% deform domain according to velocity BC ?
obj.change_size = logical(hdf5read(cf, '/domain/change_size'));

end
