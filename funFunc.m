function [selectedFea] = funFunc(feaTRAIN, gndtrain, feaTEST, gndtest)
    selectedFea = sum (max(pdist(feaTRAIN)));
    k = 0;
    D = [];
    while (k <= 8)
        for i=1:21
            dX = (pdist(feaTRAIN(:,i)).^2);
            dY = (pdist(gndtrain(:,i)).^2)
            candidate = max(dX);
            k = k +1; 
            D = D + candidate;
        end
    end
    dY = squareform((pdist(gndtrain)));
    selectedFea = sum (D);
end
