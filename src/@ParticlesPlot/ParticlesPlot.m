% Postprocessing of data stored on particles.
%
% $Id: ParticlesPlot.m 65 2010-10-08 11:00:04Z ymishin $

classdef ParticlesPlot < Particles
    
    properties (SetAccess = private)
        
        % Voronoi cells
        vcells;
        
        % coordinates of empty cells
        empty_coord;
        
    end
    
    methods (Access = public)
        
        % init voronoi
        init_voronoi(obj, postproc);
        
        % plotting routines
        plot_field(obj, postproc);
        
    end
    
    methods (Access = private)
        
        % plotting routines
        plot_field_voronoi(obj, ind, desc);
        plot_field_scatter(obj, ind, desc);
        
    end
    
end
