% Close images
close all

% Load the images
bad = load_images('Bad Images');
good = load_images('Good Images');

[badred, badcon] = process_images(bad);
[goodred, goodcon] = process_images(good);

plot_data(badred, badcon, goodred, goodcon, true);

mean(badred)
mean(badcon)
mean(goodred)
mean(goodcon)

allred = [badred; goodred];
allcon = [badcon; goodcon];

[r, p] = corrcoef(allred, allcon)
[h, p, ci, stats] = ttest2(badcon, goodcon)
[h, p, ci, stats] = ttest2(badred, goodred)

minBadRed = bad{find(badred == min(badred))};
maxGoodRed = good{find(goodred == max(goodred))};

figure, imshow(minBadRed);
figure, imshow(maxGoodRed);

maxBadCon = bad{find(badcon == max(badcon))};
minGoodCon = good{find(goodcon == min(goodcon))};

figure, imshow(maxBadCon);
figure, imshow(minGoodCon);