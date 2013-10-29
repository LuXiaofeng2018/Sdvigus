% Verbosity control.
%
% $Id: Verbose.m 61 2010-09-28 16:31:24Z ymishin $

classdef Verbose < handle
    
    properties (SetAccess = private)
        
        % verbosity level
        level;
        
    end
    
    methods (Access = public)
        
        % constructor
        function obj = Verbose(vl)
            obj.level = vl;
        end
        
        % print out a message
        function disp(obj, message, vl)
            if (obj.level >= vl)
                fprintf([message, '\n']);
            end
        end
        
    end
    
end
