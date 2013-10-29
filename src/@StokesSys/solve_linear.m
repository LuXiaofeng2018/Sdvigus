function solve_linear(obj)
% Solve linear Stokes system of equations.
%
% $Id: solve_linear.m 85 2011-12-13 19:26:35Z ymishin $

% choose appropriate solver depending on element type
switch obj.elem_type
    
    case {1,3}
        % Q1P0, Q2P-1
        obj.solve_linear_uzawa();
        
    case 2
        % Q1Q1
        obj.solve_linear_coupled();
        
end

end
