% Voronoi tessellation.
%
% $Id: VoronoiPlot.m 55 2010-08-19 16:43:03Z ymishin $

classdef VoronoiPlot < Voronoi
    
    methods (Access = public)
        
        % perform Voronoi tessellation
        vcells = compute(obj, part_data);
        
    end
    
end
