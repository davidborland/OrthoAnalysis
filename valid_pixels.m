function m = valid_pixels(im)

%%% Simple threshold-based method
%m = sum(im, 3) ./ 3;
%m = m > 0.05;

%%% Use Hough transform to find circular region
m = sum(im, 3) ./ 3;

% Scale image for performance
scale = 4;

% Hough tranform
m2 = imresize(m, 1 / scale);
s = size(m2);
r = s(1) / 2;
[c, r] = imfindcircles(m2, [r - 50, r + 50], 'Sensitivity', 0.95);

% Create mask for most likely circle
c = c(1, :) * scale;
r = r(1) * scale - 10;
s = size(m);
[xx, yy] = ndgrid((1:s(1)) - c(2), (1:s(2)) - c(1));
m = (xx.^2 + yy.^2) < r^2;

%figure, imshow(im .* m);

end