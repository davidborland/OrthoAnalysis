function m = redness(im, mask)

% Get rgb values
r = im(:, :, 1);
g = im(:, :, 2);
b = im(:, :, 3);

% Compute redness per pixel
red = max(0, r - (g + b) / 2);

% Return mean redness
m = mean(red(mask));

end

