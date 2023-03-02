function m = load_videos(directory)

% Get all of the files
filenames = dir(directory);
filenames = filenames(~[filenames.isdir]);

% Create array for images
n = length(filenames);
m = cell(n,1);

for i = 1:n        
    % Create video reader    
    m{i} = VideoReader(fullfile(filenames(i).folder, filenames(i).name));
end

end