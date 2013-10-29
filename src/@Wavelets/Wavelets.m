% Wavelets transform and adaptation utility class.
%
% $Id: Wavelets.m 53 2010-08-19 16:32:18Z ymishin $

classdef Wavelets < handle
    
    methods (Access = public, Static = true)
        
        % returns updated mask(s) for physical field(s)
        new_mask = update_mask(fmat, mask, jmax, balance_grid, ...
                               refine_fully, eps);
        
    end
    
    methods (Access = private, Static = true)
        
        % construct adapted mask for transformed field
        mask = adapt_mask_2d(fmat, jmax, jmin, balance_grid, refine_fully, eps);
        
        % forward linear wavelet transform in 2D
        fmat = fwd_transform_2d(fmat, jmax, jmin, mask);
        
        % forward linear wavelet transform
        fvec = fwd_transform_step(fvec, s, mask)
        
    end
    
end
