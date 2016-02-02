function [selectedFea] = funFunc(feaTRAIN, gndtrain, feaTEST, gndtest)
    k = 0;
    D = [];
    for (j=1:21)
        distance2 = pdist2(feaTRAIN(:,j), gndtrain, 'euclidean'); 
        D2 = sort(distance2,'descend');
    end
    
    for (i=1:8)
        selectedFea = max(D2(i));
    end
%     while (k <= 8)
%         for i=1:21
%             D = feaTrain(:,i);
%             dX = sort(pdist(feaTRAIN(:,i)).^2, 'descend');
%             dY = (pdist(gndtrain(:,1)).^2);
%             
%             D = dX;
%             if (max(dX) > candidate)
%                 D  = [D max(dX)];
%                 k = k +1; 
%             end   
%         end
%     end
%     dY = squareform((pdist(gndtrain)));
%     selectedFea = sum (D);
end
