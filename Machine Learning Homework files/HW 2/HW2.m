%%
clear 
clc 
close all



%% Exploring K nearest neighbor for classication 'advanced' - preparing the dataset
% Begin with importing the 'exam1and2.txt' file
% Then split the first 70% of the data as the training data and the other
% remaining data becomes the test data
file = readtable('exam1and2.txt');
cv = cvpartition(size(file,1),'HoldOut',0.3); % randomly distributes the contents by 70%
idx = cv.test;
% Separate to training and test data
% Recall that these sets are going to (x,3) sized
% The first column contains X, the second contains y, and the
% third contains the classification
dataTrain = table2array(file(~idx,:)); %remember tilda ~ means NOT
dataTest  = table2array(file(idx,:));


%% Applying the algorithm 
% Now use your algorithm from last week to do the classification
% Maybe define this as a user function?? meh this works
% You will need to define a user function because you need to run through
% each test case and calculate the distance from the training set because
% our previous week only did this for ONE test case.

%indexing is (r,c) not (c,r) like python REMEMBER THIS
per = 0; % creates counter to track successful knn
k = input("Please input an integer for k between 1-15")
for j = 1:size(dataTest,1)
    dist = []; % initializing dist array
    placeholder = [];
    for i = 1:size(dataTrain,1)
       dist = [dist; sqrt((dataTrain(i,1)-dataTest(j,1)).^2+((dataTrain(i,2)-dataTest(j,2)).^2))]; % currently just outputs a single array
       % need to get this to output with the associated values so that it can
       % be tracked and then sorted
       placeholder = [placeholder; dist(i), dataTrain(i,1), dataTrain(i,2), dataTrain(i,3)];
        
    end
%     dist
%     placeholder
    B = sortrows(placeholder, 1); % sorts array based on the distance  
    predict = mode(B(k,4));

    fprintf('Distances calculated and sorted for student #: %d\n',j)
    fprintf('The predicted value is %d\n',predict)
    fprintf('The actual value for this student is %d\n\n', dataTest(j,3))

    if predict == dataTest(j,3)
       per = per +1;               % calculates the error
    end

    
end
acc = (per/size(dataTest,1))*100;
fprintf('The accuracy of this model for k = %d is %.2f',k,acc)
%% Running different cases of K,and plotting the accuracy versus K 
% i =1 ;
% while i <= 5
% 
%     fprintf('%d\n',i)
% 
%     i = i+1;
% end
