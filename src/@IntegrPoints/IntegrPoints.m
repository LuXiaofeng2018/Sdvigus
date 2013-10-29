% Integration points for numerical integration utility class.
%
% $Id: IntegrPoints.m 17 2010-06-04 12:44:20Z ymishin $

classdef IntegrPoints < handle
    
    methods (Access = public, Static = true)
        
        % get coordinates and weights for 'num_inp' integration points
        [inp_coord, inp_weight] = get_coord_weight(num_inp);
        
    end
    
end
