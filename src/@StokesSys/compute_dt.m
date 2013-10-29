function dt = compute_dt(obj, courant)
% Compute time step based on Courant number.
%
% $Id: compute_dt.m 23 2010-06-04 22:46:43Z ymishin $

if (courant)
    dx = obj.grids.stokes.elemhl(1);
    dy = obj.grids.stokes.elemhl(2);
    dt = courant * min([dx / max(abs(obj.velocity(:,1))), ...
                        dy / max(abs(obj.velocity(:,2)))]);
else
    dt = [];
end

end
