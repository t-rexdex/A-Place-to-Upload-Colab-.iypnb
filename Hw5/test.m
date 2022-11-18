%% Test functions and random stuff

arr = find(h==1); % gives me the indices of where h = 1 
% % helpful to figure out how to drop these indices from h and y
% for i = 1:size(h)
%     if i == arr(i)
%         
%        fprintf('%d\n',i)
%     end
%     
%     
%     
%     
% end


test;
h_new = ones(85,1);
arr = find(h==1);
%y_new(text)
h_new = h;
h_new(arr) = [];

