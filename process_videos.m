function m = process_videos(numFrames)
if nargin < 1
    numFrames = false;
    filename = 'video_data';
else
    filename = ['video_data_' num2str(numFrames) '_frames'];
end

% Load the videos
videos = load_videos('Test Video/Clips');

n = length(videos);
m = cell(n,1);

% Process each video
for i = 1:n    
   v = videos{i};
   
   disp(['Processing ' v.Name]);
   
   % No good way to get the number of frames, so growing array for each
   % frame...
   red = [];
   con = [];
   ent = [];
   
   % Empty mask
   mask = false;
   
   % Process each frame
   while hasFrame(v)
       % Read and normalize frame
       frame = double(readFrame(v)) / 255;
       
       % Get mask for first frame
       if (~mask)
           mask = valid_pixels(frame);
       end
       
       % Get redness, contrast, and entropy for each frame      
       red = [red, redness(frame, mask)];
       
       gray = rgb2gray(frame);             
       con = [con, contrast(gray, mask)];
       ent = [ent, image_entropy(gray, mask)];
       
       if (numFrames && length(red) >= numFrames) 
           break;
       end
   end
   
   m{i} = [red; con; ent];
end

save(filename, 'videos', 'm');