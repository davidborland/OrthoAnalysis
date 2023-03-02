function plot_data(badx, bady, goodx, goody, labels)
if (~exist('labels', 'var'))
    labels = false;  
end

% Colors
r = [0.937 0.541 0.384];
b = [0.404 0.663 0.812];

repmat(r, length(badx), 1);
repmat(b, length(goodx), 1);

colors = [repmat(r, length(badx), 1); repmat(b, length(goodx), 1)];

% Combine data
x = [badx; goodx];
y = [bady; goody];

figure
hold on

% Draw together first to show least squares fit line
scatter(x, y, 1);
lsline;

% Draw points
sbad = scatter(badx, bady, [], r,'filled',...
                       'MarkerEdgeColor', 'black');

sgood = scatter(goodx, goody, [], b,'filled',...
                       'MarkerEdgeColor', 'black');
                   
% Draw labels                   
if (labels)
    badlabel = cellstr(num2str((1:length(badx))'));
    goodlabel = cellstr(num2str((1:length(goodx))'));

    text(badx, bady, badlabel);
    text(goodx, goody, goodlabel);
end    
                   
% Draw title, axis labels, and legend
title('Amount of redness vs. local pixel contrast');
xlabel('Redness');
ylabel('Contrast');
legend([sbad, sgood], {'Bad', 'Good'});

end

