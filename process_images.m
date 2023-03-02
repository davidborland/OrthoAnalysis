function [red, con] = process_images(images)

n = length(images);

red = zeros(n, 1);
con = zeros(n, 1);

for i = 1:n    
    im = images{i};
    mask = valid_pixels(im);
    
    red(i) = redness(im, mask);
    con(i) = contrast(rgb2gray(im), mask);
end

end

