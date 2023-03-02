function video_scatter_plots(filename, videoname, red, con, ent, redconCorrString, redentCorrString, conentCorrString)

directory = 'video_output/scatter/';

scatter_plot(red, con, ['Redness vs. contrast, correlation: ' redconCorrString], 'Redness', 'Contrast', [videoname '_redcon_scatter']);
scatter_plot(red, ent, ['Redness vs. entropy, correlation: ' redentCorrString], 'Redness', 'Entropy', [videoname '_redent_scatter']);
scatter_plot(con, ent, ['Contrast vs. entropy, correlation: ' conentCorrString], 'Contrast', 'Entropy', [videoname '_conent_scatter']);

function scatter_plot(x, y, plotTitle, xLabel, yLabel, outFilename)
    figure;
    hold on;

    % Draw least squares line
    scatter(x, y);
    lsline;

    % Draw points
    scatter(x, y, 'MarkerEdgeAlpha', 0.2);  

    % Draw title, axis labels, and legend
    title({filename, plotTitle}, 'Interpreter', 'none');
    xlabel(xLabel);
    ylabel(yLabel);

    print([directory outFilename], '-dpdf');
end

end