% Voronoi tessellation.
%
% $Id: Voronoi.m 53 2010-08-19 16:32:18Z ymishin $

classdef Voronoi < handle
    
    properties (SetAccess = public)
        
        % domain dimensions
        dsize;
        
        % grid resolution
        res;
        
        % resolution of Voronoi cells
        vres;
        
        % Voronoi cells corresponding to particles of
        % fixed types will not be splitted / destroyed
        fixed_types;
        
        % max and min normalized area of Voronoi cell
        min_area;
        max_area;
        
    end
    
    methods (Access = public)
        
        % perform Voronoi tessellation
        part_data = compute(obj, part_data);
        
    end
    
end
