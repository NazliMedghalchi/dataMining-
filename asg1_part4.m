%% REF:
% https://www.mathworks.com/matlabcentral/newsreader/view_thread/162772
import plotImages.*
dataC = importdata('DataC.mat');
% First do Minmax Normalization on data
dataC.fea(all(isnan(dataC.fea))) = median(dataC.fea(:),'omitnan');
dataC.fea = filter(median(dataC.fea,2),2,dataC.fea); 

for i=1:21
    feaMin(i) = min(dataC.fea(:,i));
end
for i=1:21
    feaMax(i) = max(dataC.fea(:,i));
end
for (i=1:size(dataC.fea,1))
    for(j=1:size(dataC.fea,2))
        dataNorm(i,j) = (dataC.fea(i,j) - min(feaMin(j)))./(feaMax(j) - feaMin(j));
    end
end
figure
plot(dataNorm);

d1_i = dataC.fea - min(dataC.fea,2);
d2_j = max(dataC.fea,2) - min(dataC.fea,2);
if any(dataC.fea(:))
  Ndata = (dataC.fea - min(dataC.fea(:)) + realmin) ./ (max(dataC.fea(:))-min(dataC.fea(:)));
  NA(Ndata==0) = realmin;
else
  Ndata = repmat(1/2, size(dataC.fea));
end

% dataNorm = (dataC.fea(:) - min(dataC.fea(:),2))./(max(dataC.fea(:),2) - min(dataC.fea(:),2));
figure
plot(Ndata);
title('Nomralized DataC');
xlabel('Samples of 21 Feature');
ylabel('Normalized Values of Samples');

%% Apply SFS startegy with square Euclidean distance
    xt = randperm(2100, 1050);
    yt = randperm(2100, 1050);
    XTRAIN = dataC.fea(1:xt,:);
    XTEST = dataC.fea(xt:end,:);
    ytrain = dataC.fea(1:yt,:);
    ytest = dataC.fea(yt:end,:);
    dataTrain = funFunc(XTRAIN, ytrain, XTEST, ytest);
sfSearch = sequentialfs(funFunc, Ndata, dataTrain);
sfSearch;
%% Apply Naive Bayes Classifier realize a Wrapper based feature selection w/ SFS 
predictClass = classify(XTEST, XTRAIN, ytrain);
for i=1:21
%     while (i+3)<21
        NBmodel = classify(dataC.fea(:,XTest), XTrain, ytrian,gnd);
        NBmodel.ClassLevels;
        NBmodel.Params;
end

  %%
