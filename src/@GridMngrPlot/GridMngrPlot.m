% Grid manager to use at postprocessing stage.
%
% $Id: GridMngrPlot.m 63 2010-10-01 10:13:18Z ymishin $

classdef GridMngrPlot < GridMngr
    
    methods (Access = public)
        
        % plotting routines
        plot_grid(obj, postproc);
        plot_grid_cf(obj, desc);
        
    end
    
end
