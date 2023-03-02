function analyze_videos(filename)
if nargin < 1
    filename = 'video_data';
end

% Close images
close all;

% Get the data from a file output by process_images
data = load(filename);
videos = data.videos;
videoData = data.m;

n = length(videoData);

redconCorrs = zeros(1,n);
redentCorrs = zeros(1,n);
conentCorrs = zeros(1,n);

redMean = zeros(1,n);
conMean = zeros(1,n);
entMean = zeros(1,n);

allRed = [];
allCon = [];
allEnt = [];

% Get max value for plotting
%{
maxValue = 0;
for i = 1:n    
    maxValue = max([maxValue max(max(videoData{i}))]);
end
maxValue = ceil(maxValue);
%}

% Plot values for each video over time
for i = 1:n
    d = videoData{i};
    filename = videos{i}.name;
    videoname = filename(1:end-4);
    
    duration = videos{i}.Duration;
    
    red = d(1,:);
    con = d(2,:);
    ent = d(3,:);
    
    redNorm = normalize_vector(red);
    conNorm = normalize_vector(con);
    entNorm = normalize_vector(ent); 
    
    redMean(i) = mean(red);
    conMean(i) = mean(con);
    entMean(i) = mean(ent);
        
    % Compute correlations
    [r, p] = corrcoef(red, con);
    redconCorrs(i) = r(1, 2);
    redconCorrString = num2str(redconCorrs(i));
    
    [r, p] = corrcoef(red, ent);
    redentCorrs(i) = r(1, 2);
    redentCorrString = num2str(redentCorrs(i));
    
    [r, p] = corrcoef(con, ent);
    conentCorrs(i) = r(1, 2);
    conentCorrString = num2str(conentCorrs(i));
    
    % Time axis for line plots
    x = (0:length(red) - 1) / length(red) * duration;
    
    video_line_plots(filename, videoname, x, red, con, ent, redNorm, conNorm, entNorm, redconCorrString, redentCorrString, conentCorrString);
    video_scatter_plots(filename, videoname, red, con, ent, redconCorrString, redentCorrString, conentCorrString);
end    

% Print correlations
redconCorrs
redentCorrs
conentCorrs

% Scatterplots
close all;

all_videos_scatter_plots(redMean, conMean, entMean, videoData);

function m = normalize_vector(v)
    m = (v - min(v)) / (max(v) - min(v));
end

end