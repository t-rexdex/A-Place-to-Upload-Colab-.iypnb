%%%
clear 
clc 
close all

% To complete the assignment you need to rewrite the function to use a
% SINGLE test case, keep the training part as it is
% Create 2 new foor loops the outer loop needs to be the "student id" i.e
% what you originally called j, and the inner loop needs to be the k value.
% run the k loop so that you can store the accuracy of k at each value of k
% and then student 


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
    predict = mode(B(1:k,4));

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
% Test case for k = 3 is done above.
% Will need to convert to user defined function in order to improve results
% so that you can store accuracy vs k value neatly
grapharr = []; % stores values for the graphing portion thats about to happen.
for k = 1:2:15
    per = 0; % initializes per for every new iteration of k
    for j = 1:size(dataTest,1)

        SortedDist= knn(dataTest(j,1),dataTest(j,2), dataTrain); % Matrix containing sort distance, x1, x2, c
        predict = mode(SortedDist(1:k,4)); % sorts the necessary amount of nearest neighbours for the current iteration of k

        if predict == dataTest(j,3) % condition to increase counter to count accuracy
        per = per +1;               % calculates the error
        end

    end
    acc = (per/size(dataTest,1)); % accuracy caluclation
    grapharr = [ grapharr; k, acc]; 
end
plot(grapharr(:,1),grapharr(:,2))
title('Classification Accuracy vs K value')
xlabel('K Value')
ylabel('Accuracy')
xlim([0,16])
ylim([0 1.2])
% How ot gather the accuracy across values of k
% assume k is an array 1-15

function SortedDist = knn(dataTest1,dataTest2,dataTrain) % separating the test case so that it can be run individually

            dist = []; % initializing dist array
            placeholder = [];
            for i = 1:size(dataTrain,1)
               dist = [dist; sqrt((dataTrain(i,1)-dataTest1).^2+((dataTrain(i,2)-dataTest2).^2))]; 
               placeholder = [placeholder; dist(i), dataTrain(i,1), dataTrain(i,2), dataTrain(i,3)];
                
            end
            
            SortedDist = sortrows(placeholder, 1); % sorts array based on the distance  
            
% right not this only predicts for one student at a time 
  
end % currently only outputs final array of B need to store this and then run through each case to hold the k value to the accuracy


