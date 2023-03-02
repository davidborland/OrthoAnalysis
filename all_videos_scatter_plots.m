function all_videos_scatter_plots(red, con, ent, videoData)

directory = 'video_output/';

% From Color Brewer
%colors = [[166,206,227]; [31,120,180]; [178,223,138]; [51,160,44]; [251,154,153]; [227,26,28]; [253,191,111]; [255,127,0]; [202,178,214]; [106,61,154]] / 255;
colors = [[141,211,199]; [255,255,179]; [190,186,218]; [251,128,114]; [128,177,211]; [253,180,98]; [179,222,105]; [252,205,229]; [217,217,217]; [188,128,189]] / 255;

n = length(red);                   
labels = cellstr(num2str((1:n)'));

reds = cell(n,1);
cons = cell(n,1);
ents = cell(n,1);

for i = 1:n    
    d = videoData{i};
    
    reds{i} = d(1,:);
    cons{i} = d(2,:);
    ents{i} = d(3,:);
end

scatter_plot(red, con, reds, cons, 'Redness vs. contrast', 'Redness', 'Contrast', 'scatter_redcon');
scatter_plot(red, ent, reds, ents, 'Redness vs. entropy', 'Redness', 'Entropy', 'scatter_redent');
scatter_plot(con, ent, cons, ents, 'Contrast vs. entropy', 'Contrast', 'Entropy', 'scatter_conent');

function scatter_plot(xMean, yMean, x, y, plotTitle, xLabel, yLabel, outFilename)   

    % Just means
    figure;
    hold on;

    % Draw least squares line
    scatter(xMean, yMean);
    lsline;

    % Draw points
    scatter(xMean, yMean, 'MarkerEdgeColor', 'black');
    text(xMean, yMean, labels);  

    % Draw title, axis labels, and legend
    title(plotTitle);
    xlabel(xLabel);
    ylabel(yLabel);

    print([directory outFilename '_means'], '-dpdf');
    

    % Means and original data points
    allX = [];
    allY = [];
    
    % Means and original for "redder" clips
    someX = [];
    someY = [];
    
    for j = 1:n
        allX = [allX x{j}];
        allY = [allY y{j}];
    end
    
    for j = 3:n
        someX = [someX x{j}];
        someY = [someY y{j}];
    end
    
    figure;
    hold on;

    % Draw least squares lines
    scatter(allX, allY);
    lsline;
    
    scatter(someX, someY);
    lsline;

    % Draw points
    for j = 1:n 
        % Why is MarkerEdge not working?
        scatter(x{j}, y{j}, 'MarkerEdgeColor', 'none', 'MarkerEdgeAlpha', 0, 'MarkerFaceColor', colors(j,:), 'MarkerFaceAlpha', 0.2);        
    end
    scatter(xMean, yMean, 'MarkerEdgeColor', 'black');
    text(xMean, yMean, labels);  

    % Draw title, axis labels, and legend
    title(plotTitle);
    xlabel(xLabel);
    ylabel(yLabel);

    print([directory outFilename '_all'], '-dpdf');

end

end
