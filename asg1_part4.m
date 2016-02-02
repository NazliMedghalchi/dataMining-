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
dataNorm = zeros(2100,21);
for (i=1:size(dataC.fea,1))
    for(j=1:size(dataC.fea,2))
        dataNorm(i,j) = (dataC.fea(i,j) - min(feaMin(j)))./(feaMax(j) - feaMin(j));
    end
end
figure
plot(dataNorm);
title('Nomralized DataC - iterative loops');
xlabel('Samples of 21 Feature');
ylabel('Normalized Values of Samples');

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
    feaTrain = dataC.fea(1:xt,:);
    feaTest = dataC.fea(xt:end,:);
    labelTrain = dataC.gnd(1:yt,:);
    labelTest = dataC.gnd(yt:end,:);
    fun = funFunc(feaTrain, labelTrain, feaTest, labelTest)
    sfSearch = sequentialfs(fun, Ndata.fea, Ndata.gnd);
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
