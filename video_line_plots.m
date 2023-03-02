function video_line_plots(filename, videoname, x, red, con, ent, redNorm, conNorm, entNorm, redconCorrString, redentCorrString, conentCorrString)

directory = 'video_output/line/';

% Colors
col1 = [0.6350 0.0780 0.1840];
col2 = [0 0.4470 0.7410];
col3 = [0.4660 0.6740 0.1880];

line_plot(x, red, con, col1, col2, ['Redness vs. contrast, correlation: ' redconCorrString], 'Redness', 'Contrast', [videoname '_redcon_line']);
line_plot(x, redNorm, conNorm, col1, col2, ['Redness vs. contrast (normalized), correlation: ' redconCorrString], 'Redness', 'Contrast', [videoname '_redcon_normalized_line']);

line_plot(x, red, ent, col1, col3, ['Redness vs. entropy, correlation: ' redentCorrString], 'Redness', 'Entropy', [videoname '_redent_line']);
line_plot(x, redNorm, entNorm, col1, col3, ['Redness vs. entropy (normalized), correlation: ' redentCorrString], 'Redness', 'Entropy', [videoname '_redent_normalized_line']);

line_plot(x, con, ent, col2, col3, ['Contrast vs. entropy, correlation: ' conentCorrString], 'Contrast', 'Entropy', [videoname '_conent_line']);
line_plot(x, conNorm, entNorm, col2, col3, ['Contrast vs. entropy (normalized), correlation: ' conentCorrString], 'Contrast', 'Entropy', [videoname '_conent_normalized_line']);

function line_plot(x, y1, y2, color1, color2, plotTitle, label1, label2, outFilename)
    figure;
    hold on;
    
    plot(x, y1, 'Color', color1);
    plot(x, y2, 'Color', color2);
    
    title({filename, plotTitle}, 'Interpreter', 'none');
    xlabel('Time') ;
    ylabel('Value');
    legend({label1, label2}, 'Location', 'bestoutside');

    print([directory outFilename], '-dpdf');
end

end
