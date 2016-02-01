function [dataTrain] = funFunc(XTRAIN, ytrain, XTEST, ytest)
    d1 = pdist(XTRAIN);
    d2 = pdist(ytrain);
    dataTrian = sum(d1, d2);
end
