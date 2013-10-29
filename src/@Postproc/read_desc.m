function read_desc(obj)
% Read description file and add properties dynamically.
%
% $Id: read_desc.m 63 2010-10-01 10:13:18Z ymishin $

% run description script
run(obj.desc);

% find all added variables
vars = who;
vars(strcmp(vars, 'obj')) = [];

% add variables as properties
for i = 1:length(vars)
    P = obj.addprop(vars{i});
    P.SetAccess = 'private';
    obj.(vars{i}) = eval(vars{i});
end

end
