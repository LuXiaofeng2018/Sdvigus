% Boundary conditions for Stokes system.
%
% $Id: StokesBC.m 53 2010-08-19 16:32:18Z ymishin $

classdef StokesBC < handle
    
    properties (SetAccess = private)
        
        % values of velocities at boundaries
        val;
        
        % flags indicating unconstrained velocities
        free;
        
    end
    
    methods (Access = public)
        
        % init
        init(obj, df, cf);
        
    end
    
end
