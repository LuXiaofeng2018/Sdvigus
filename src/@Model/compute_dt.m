function compute_dt(obj)
% Compute time step.
%
% $Id: compute_dt.m 60 2010-09-28 16:11:19Z ymishin $

global verbose;

% compute time step based on Courant number
dt_courant = obj.stokes_sys.compute_dt(obj.courant);

% use minimum
obj.dt = min([obj.dt_default, dt_courant]);

verbose.disp(['Timestep: ', num2str(obj.dt)], 1);

end
