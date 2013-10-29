function read_data(obj)
% Read all data and initialize all objects.
%
% $Id: read_data.m 63 2010-10-01 10:13:18Z ymishin $

% file names
if (obj.nstep > -1)
    df = [obj.model_name, '_', num2str(obj.nstep, '%05d'), '.h5'];
else
    df = [obj.model_name, '_init', '.h5'];
end
mf = [obj.model_name, '_mtrl', '.h5'];
cf = [obj.model_name, '_ctrl', '.h5'];

% time parameters
obj.current_time = hdf5read(df, '/time/current_time');

% create main objects
delete(obj.domain); obj.domain = Domain();
delete(obj.particles); obj.particles = ParticlesPlot();
delete(obj.grids); obj.grids = GridMngrPlot();
delete(obj.stokes_sys); obj.stokes_sys = StokesSysPlot();

% and initialize them
obj.domain.init(df, cf);
obj.grids.init(df, cf, obj.domain, obj.particles, obj.stokes_sys);
obj.particles.init(df, mf, cf, obj.domain, obj.grids, obj.stokes_sys);
obj.particles.init_voronoi(obj);
obj.stokes_sys.init(df, cf, obj.domain, obj.grids, obj.particles);

end
