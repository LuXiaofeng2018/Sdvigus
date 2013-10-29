% Shape functions and their derivatives utility class.
%
% $Id: ShapeFuncs.m 62 2010-09-29 14:29:27Z ymishin $

classdef ShapeFuncs < handle
    
    methods (Access = public, Static = true)
        
        % compute shape functions
        N = compute(inp_coord, num_node);
        
        % compute derivatives of shape functions
        dN = compute_der(inp_coord, num_node);
        
    end
    
end
