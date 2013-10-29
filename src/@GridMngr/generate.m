function generate(obj)
% Generate grid.
%
% $Id: generate.m 79 2010-12-02 06:35:52Z ymishin $

global verbose;

% check if domain size was changed
if (any(obj.stokes.dsize ~= obj.domain.size))
    obj.stokes.dsize = obj.domain.size;
    obj.stokes_update = true;
end

% re-generate grid if necessary
if (obj.stokes_update)
    if (obj.stokes.jmax > 1)
        % multilevel grid
        obj.stokes.generate_multilevel();
    else
        % equidistant grid
        obj.stokes.generate_simple();
    end
    obj.stokes_update = false;
end

num_elem = size(obj.stokes.elem2node, 2);
verbose.disp(['Number of elements: ', num2str(num_elem)], 1);

end
