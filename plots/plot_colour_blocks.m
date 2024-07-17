function [colourBlock_handles,colourBlock_labels] = plot_colour_blocks(fig, Rule, dayNum, para)

    set(0, 'currentfigure', fig);  % set current figure

    Rule_idx = findgroups(Rule);
    Rule_change = ~([Rule_idx;0] - [0;Rule_idx])==0;
    Rule_change_idx = find(Rule_change);
    Rule_change_idx(end) = Rule_change_idx(end)-1;

    ylim_vals = ylim;
    ymin = ylim_vals(1);
    ymax = ylim_vals(2);

    j=0;

    for i = 1:sum(Rule_change)-1
        t1 = dayNum(Rule_change_idx(i));
        t2 = dayNum(Rule_change_idx(i+1));
        Rule_i = Rule(Rule_change_idx(i));
        if strcmp(Rule_i, 'Pro_Only'), c = para.colour_pro; 
        elseif strcmp(Rule_i, 'Anti_Only'), c = para.colour_anti; 
        elseif strcmp(Rule_i, 'Blocks_30'), c = para.colour_blocks_30; 
        elseif strcmp(Rule_i, 'Blocks_15'), c = para.colour_blocks_15;
        elseif strcmp(Rule_i, 'Random_Alternation'), c = para.colour_random_alternation;
        else
            c = [0.8 0.8 0.8];
            warning('Colour has not been specified for this rule.')
        end
        xline(t2, 'Color', [0.6510 0.6510 0.6510]);
        colourBlock_handles(i) = patch([t1 t2 t2 t1], [ymin ymin ymax ymax], c, 'LineStyle', 'none');
        colourBlock_handles(i).FaceAlpha = 0.2;
        colourBlock_labels(i) = Rule_i;

    end

    % remove duplicates
    [colourBlock_labels,idx,~] = unique(colourBlock_labels, 'stable');
    colourBlock_handles = colourBlock_handles(1,idx);

    % replace "_" in RuleStr with " " in each cell in cell array
    replaceUnderscore = @(cellStr) strrep(cellStr, '_', ' ');
    colourBlock_labels = cellfun(replaceUnderscore, colourBlock_labels, 'UniformOutput', false);

    % move below other figure elements
    uistack(colourBlock_handles, "bottom");

end