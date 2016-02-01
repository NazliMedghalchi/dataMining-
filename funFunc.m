function [dataTrain] = funFunc(XTRAIN, ytrain, XTEST, ytest)
    d1 = square(pdist(XTRAIN));
    d2 = square(pdist(ytrain));
    dataTrian = sum(d1, d2);
end
