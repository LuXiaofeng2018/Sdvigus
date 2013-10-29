function dN = compute_der(inp_coord, num_node)
% Compute derivatives of shape functions 'dN' at local integration
% points 'inp_coord' for element with 'num_node' number of nodes.
%
% $Id: compute_der.m 62 2010-09-29 14:29:27Z ymishin $

% number of points
num_inp = size(inp_coord, 2);

% preallocate
dN = zeros(2 * num_inp, num_node);

% local coordinates
xi  = inp_coord(1,:)';
eta = inp_coord(2,:)';

switch num_node
    
    case 1
        % shape functions derivatives
        % all zeros - do nothing here
        
    case 3
        % shape functions derivatives
        dN(1:2:end-1,2) = 1; % wrt xi
        dN(2:2:end,3)   = 1; % wrt eta
        
    case 4
        % 1D polynomials
        p10 = 0.5 * (1.0 - xi);
        p11 = 0.5 * (1.0 + xi);
        p20 = 0.5 * (1.0 - eta);
        p21 = 0.5 * (1.0 + eta);
        % 1D polynomials derivatives
        p10d = -0.5;
        p11d =  0.5;
        p20d = -0.5;
        p21d =  0.5;
        % shape functions derivatives
        dN(1:2:end-1,:) = [ ...
            p10d .* p20 ...
            p11d .* p20 ...
            p11d .* p21 ...
            p10d .* p21]; % wrt xi
        dN(2:2:end,:) = [ ...
            p10 .* p20d ...
            p11 .* p20d ...
            p11 .* p21d ...
            p10 .* p21d]; % wrt eta
        
    case 9
        % 1D polynomials
        p10 = 0.5 * xi .* (xi - 1.0);
        p11 = -(xi + 1.0) .* (xi - 1.0);
        p12 = 0.5 * xi .* (xi + 1.0);
        p20 = 0.5 * eta .* (eta - 1.0);
        p21 = -(eta + 1.0) .* (eta - 1.0);
        p22 = 0.5 * eta .* (eta + 1.0);
        % 1D polynomials derivatives
        p10d = 0.5 * (2 * xi - 1.0);
        p11d = -2.0 * xi;
        p12d = 0.5 * (2 * xi + 1.0);
        p20d = 0.5 * (2 * eta - 1.0);
        p21d = -2.0 * eta;
        p22d = 0.5 * (2 * eta + 1.0);
        % shape functions derivatives
        dN(1:2:end-1,:) = [ ...
            p10d .* p20 ...
            p12d .* p20 ...
            p12d .* p22 ...
            p10d .* p22 ...
            p11d .* p20 ...
            p12d .* p21 ...
            p11d .* p22 ...
            p10d .* p21 ...
            p11d .* p21]; % wrt xi
        dN(2:2:end,:) = [ ...
            p10 .* p20d ...
            p12 .* p20d ...
            p12 .* p22d ...
            p10 .* p22d ...
            p11 .* p20d ...
            p12 .* p21d ...
            p11 .* p22d ...
            p10 .* p21d ...
            p11 .* p21d]; % wrt eta
        
end

end
