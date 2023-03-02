function h = image_entropy(im, mask)

h = entropy(im(mask));
n = numel(im);
maxH = entropy((1:n) / n);
h = h / maxH;

end

