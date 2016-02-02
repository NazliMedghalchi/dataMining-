import plotImages.*;
%% -----Part1----- Detect problems
data = importdata('DataA.mat');
% First plot the oroginal dataset
figure
plot(data)
title('Data values of DatasetA - color separated features');
xlabel('Time Series');
ylabel('Results of time-series');

%% -----Part2------ Take the mean with the omitnan (remove NaN)pdist

% Remove 3 cols with NaN
data(:,34:36) = [];   
% Remove rows with NaN
data(all(isnan(data),2),:)= [];
% Remove NaN elements left in dataset
data(isnan(data)) = median(data(:),'omitnan');

figure
plot(data);
xlabel('Time Series');
ylabel('Results of time-series');
title('Data values of DatasetA after cleaning NaN - color separated features');

% Smooth data within a window - Fix outliers
dataS = filter(median(data,2),10,data);
figure
plot(dataS);
title('Smoothed after cleaning NaN DatasetA - color separated features');
xlabel('Time Series');
ylabel('Results of time-series');
% 
% figure
% h1 = histc (dataS,min(dataS):max(dataS));
% title('Binned DataA into 9 bins');
% xlabel('Sensors');
% ylabel('Smooth datasetA');

%% --------Part3----------

% Min-Max Normalization for features 9 and 24

fea24 = dataS(:,24);
fea9 = dataS(:,9);

d1 = (fea9 - min(fea9));
d2 = max(fea9) - min(fea9);
minmax9 = (fea9 - min(fea9))./(max(fea9) - min(fea9));
histogram(minmax9)
h2 = histogram(minmax9),grid on;
title('Minmax normalization for Feature 9');
xlabel('Time Series focused on feature 9');
ylabel('Normalized values for feature 9');

d1 = (fea24 - min(fea24));
d2 = max(fea24) - min(fea24);
minmax24 = d1/d2;
figure
h3 = histogram (minmax24),grid on;
title('Minmax normalization for Feature 24');
xlabel('Time Series focused on feature 24');
ylabel('Normalized values for feature 24');

% Z-score Normalization
dataZ = zscore(fea9);
% dataNormZ = (data(:,9)-mean(data(:,9))/std(data(:,9)));
figure
h = histogram(dataZ);
% bar(dataNormZ);
title('Z-Score normalization for Feature 9');
xlabel('Time Series focused on feature 9');
ylabel('Normalized values for feature 9');

dataZ24 = zscore(fea24);
% dataNormZ = (data(:,24)-mean(data(:,24))/std(data(:,24)));
figure
h = histogram(dataZ24), grid on;
title('Z-Score normalization for Feature 24');
xlabel('Time Series focused on feature 24');
ylabel('Normalized values for feature 24');
% figure
% h = histogram(dataNormZ);
% calculate Mode for every row including NaN
% modeData = mode(data,2);

% figure
% bar(modeData);
% title('Mode values for DatasetA');
% xlabel('Sensors');
% ylabel('Mode represented for data captured of sensors');

% take Mean omitting NaN
% meanData = mean(data,'omitnan');

% figure
% plot(meanData,'*');
% title('Mean values of every column omitting NaN value on DatasetA');
% xlabel('Sensors');
% ylabel('Mean represented for column vectors on DatasetA');

% Replace NaN with Zero
% dataZero = data;
% dataZero(isnan(dataZero)) = 0;

% figure
% bar(dataZero);
% title('Mean after replacing NaN with Zero');
% xlabel('Sensor Features');
% ylabel('Mean value for fixed NaN with zero');
% 

% Replacing NaN in origianl Dataset with mean of every row
% [row,col] = find(isnan(data))
% data(nanA) = mean(data,2)

% figure
% plot(dataZero, 's');
% title('Mean after replacing NaN with Mean');
% xlabel('Sensor Features');
% ylabel('Mean value for fixed NaN with Mean');

% medianA(1,i) = median(data,2);