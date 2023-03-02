function m = load_images(directory)

% Get all of the files
filenames = dir(directory);
filenames = filenames(~[filenames.isdir]);

% Create array for images
n = length(filenames);
m = cell(n,1);

for i = 1:n    
    % Read and convert to [0, 1]
    m{i} = double(imread(fullfile(filenames(i).folder, filenames(i).name))) / 255;
end

end

