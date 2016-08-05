X_feature = zeros(size(X2,1),2);

for i = 1:size(X2,1)
    tmp = X2(i);
    tmp = tmp{1};
    
    X_feature(i,1)  = mean(tmp);
    X_feature(i,2) = std(tmp);
end

% t_avg = mean(X_feature);
% t_std = std(X_feature);
% 
% for i = 1:size(X_feature,1)
%     X_feature(i,:) = (X_feature(i,:)-t_avg)/t_std;
% end
    