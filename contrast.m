function m = contrast(im, mask)

kernel = [-1, -1, -1, -1, 8, -1, -1, -1] / 8;
diff = conv2(im, kernel, 'same');
m = mean2(diff(mask));

end

