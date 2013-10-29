function plot_field_voronoi(obj, ind, desc)
% Plot data field using Voronoi tessellation.
% Data field to plot is first interpolated to an equidistant
% grid using Voronoi tessellation and then plotted from this grid.
%
% $Id: plot_field_voronoi.m 66 2010-10-08 11:00:38Z ymishin $

% assign particles to elements
obj.reshape_data('cell_hl');

% grid and Voronoi resolutions
num_dp_x = obj.voronoi.vres(1);
num_dp_y = obj.voronoi.vres(2);
num_elem_x = obj.grids.reshl(1);
num_elem_y = obj.grids.reshl(2);
num_elem = num_elem_x * num_elem_y;

% perform Voronoi tessellation
if (isempty(obj.vcells))
    obj.vcells = obj.voronoi.compute(obj.data);
end

% preallocate
fdata = zeros(num_dp_y * num_elem_y, num_dp_x * num_elem_x);
fdata = mat2cell(fdata, repmat(num_dp_y, 1, num_elem_y), ...
                        repmat(num_dp_x, 1, num_elem_x));

% interpolate properies to an equidistant grid
data = obj.data;
vcells = obj.vcells;
parfor iel = 1:num_elem
    
    % is element empty ?
    edata = data{iel};
    if (isempty(edata))
        continue;
    end
    
    % interpolate
    num_part = size(edata, 1);
    evcells = double(vcells(iel,:));
    m = (evcells <= num_part);
    fdata{iel}(m) = edata(evcells(m), ind);
    fdata{iel} = reshape(fdata{iel}, num_dp_y, num_dp_x);
    
end
clear data vcells;
fdata = cell2mat(fdata);

% find empty space
empty_cells = (fdata == 0);

% modify for log-plot
if (isfield(desc,'log') && ~isempty(desc.log) && desc.log)
    fdata = log10(fdata);
end

% plot the data
X = linspace(obj.domain.size(1), obj.domain.size(2), num_elem_x * num_dp_x + 1);
Y = linspace(obj.domain.size(3), obj.domain.size(4), num_elem_y * num_dp_y + 1);
fdata = [fdata; fdata(end,:)];
fdata = [fdata, fdata(:,end)];
pcolor(X, Y, fdata);
clear fdata;
shading flat;

% make empty space to be white
num_empty = nnz(empty_cells);
if (num_empty > 0)
    if (isempty(obj.empty_coord))
        % construct coordinates of empty cells
        grid = Grid();
        grid.dsize = obj.domain.size;
        grid.elem_order = 1;
        grid.res = [num_elem_x * num_dp_x, num_elem_y * num_dp_y];
        grid.generate_simple();
        obj.empty_coord{1} = reshape(grid.node_coord( ...
            1, grid.elem2node(1:4, empty_cells)), 4, num_empty);
        obj.empty_coord{2} = reshape(grid.node_coord( ...
            2, grid.elem2node(1:4, empty_cells)), 4, num_empty);
        delete(grid);
    end
    % add white empty cells to the plot
    hold on;
    patch(obj.empty_coord{1}, obj.empty_coord{2}, 0, ...
        'EdgeColor', 'none', 'FaceColor', 'w');
    hold off;
end

end
