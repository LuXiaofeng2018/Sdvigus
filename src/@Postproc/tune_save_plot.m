function tune_save_plot(obj, name, desc)
% Tune and save the plot.
%
% $Id: tune_save_plot.m 85 2011-12-13 19:26:35Z ymishin $

% useful variables
model = obj.model_name;
time = obj.current_time;
stime = num2str(time);
nstep = obj.nstep;
snstep = num2str(nstep, '%05d');
outdir = obj.outdir;

% tune the plot
box on;
axis xy equal;
if (isfield(desc,'axis') && ~isempty(desc.axis))
    axis(desc.axis);
else
    axis(obj.domain.size);
end
if (isfield(desc,'cmap') && ~isempty(desc.cmap))
    colormap(desc.cmap);
end
if (isfield(desc,'clim') && ~isempty(desc.clim))
    caxis(desc.clim);
end
if (isfield(desc,'fontsize') && ~isempty(desc.fontsize))
    set(gca,'FontSize',desc.fontsize);
end
if (isfield(desc,'title') && ~isempty(desc.title))
    title(eval(desc.title));
elseif (isfield(desc,'titlet') && ~isempty(desc.titlet))
    title(eval(desc.titlet),'interpreter','latex');
end
if (isfield(desc,'xlabel') && ~isempty(desc.xlabel))
    xlabel(eval(desc.xlabel));
elseif (isfield(desc,'xlabelt') && ~isempty(desc.xlabelt))
    xlabel(eval(desc.xlabelt),'interpreter','latex');
end
if (isfield(desc,'ylabel') && ~isempty(desc.ylabel))
    ylabel(eval(desc.ylabel));
elseif (isfield(desc,'ylabelt') && ~isempty(desc.ylabelt))
    ylabel(eval(desc.ylabelt),'interpreter','latex');
end
if (isfield(desc,'xtick') && ~isempty(desc.xtick))
    set(gca,'XTick',desc.xtick);
end
if (isfield(desc,'ytick') && ~isempty(desc.ytick))
    set(gca,'YTick',desc.ytick);
end
if (isfield(desc,'xticklabel') && ~isempty(desc.xticklabel))
    set(gca,'XTickLabel',desc.xticklabel);
end
if (isfield(desc,'yticklabel') && ~isempty(desc.yticklabel))
    set(gca,'YTickLabel',desc.yticklabel);
end
if (isfield(desc,'ticklength') && ~isempty(desc.ticklength))
    set(gca,'TickLength',desc.ticklength*get(gca,'TickLength'))
end
if (isfield(desc,'tickdir') && ~isempty(desc.tickdir))
    set(gca,'TickDir',desc.tickdir);
end
if (isfield(desc,'linewidth') && ~isempty(desc.linewidth))
    set(gca,'LineWidth',desc.linewidth);
end
set(gca,'Layer','top');

% add the colorbar
if (isfield(desc,'colorbar') && ~isempty(desc.colorbar))
    cbar = desc.colorbar;
    if (isfield(cbar,'plot') && ~isempty(cbar.plot) && cbar.plot)
        if (isfield(cbar,'loc') && ~isempty(cbar.loc))
            hcb = colorbar(cbar.loc);
        else
            hcb = colorbar;
        end
        if (isfield(cbar,'fontsize') && ~isempty(cbar.fontsize))
            set(hcb,'FontSize',cbar.fontsize);
        end
        if (isfield(cbar,'xtick') && ~isempty(cbar.xtick))
            set(hcb,'XTick',cbar.xtick);
        end
        if (isfield(cbar,'ytick') && ~isempty(cbar.ytick))
            set(hcb,'YTick',cbar.ytick);
        end
        if (isfield(cbar,'xticklabel') && ~isempty(cbar.xticklabel))
            set(hcb,'XTickLabel',cbar.xticklabel);
        end
        if (isfield(cbar,'yticklabel') && ~isempty(cbar.yticklabel))
            set(hcb,'YTickLabel',cbar.yticklabel);
        end
        if (isfield(cbar,'ticklength') && ~isempty(cbar.ticklength))
            set(hcb,'TickLength',cbar.ticklengths*get(gca,'TickLength'))
        end
        if (isfield(cbar,'tickdir') && ~isempty(cbar.tickdir))
            set(hcb,'TickDir',cbar.tickdir);
        end
        if (isfield(cbar,'linewidth') && ~isempty(cbar.linewidth))
            set(hcb,'LineWidth',cbar.linewidth);
        end
    end
end

% execute custom functions
if (isfield(desc,'custom_funcs'))
    custom_funcs = desc.custom_funcs;
    for i = 1:length(custom_funcs)
        custom_funcs{i}(obj);
    end
end

% save the plot
if (isfield(desc,'fname') && ~isempty(desc.fname))
    fname = eval(desc.fname);
else
    fname = [model, '_', name, '_', snstep];
end
if (isfield(desc,'rend') && ~isempty(desc.rend))
    rend = ['-', desc.rend];
else
    rend = '-zbuffer';
end
if (isfield(desc,'fmt') && ~isempty(desc.fmt))
    fmt = ['-d', desc.fmt];
else
    fmt = '-djpeg';
end
if (isfield(desc,'dpi') && ~isempty(desc.dpi) )
    rdpi = ['-r', num2str(desc.dpi)];
else
    rdpi = '-r100';
end
print(rend, fmt, rdpi, [outdir, '/', fname]);

end
