function r = isprop(obj, prop)
% Returns true if object has property 'prop'.
%
% $Id: isprop.m 55 2010-08-19 16:43:03Z ymishin $

try
    tmp = obj.(prop);
    r = true;
catch
    r = false;
end
