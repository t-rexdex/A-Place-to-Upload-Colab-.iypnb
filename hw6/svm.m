clc; clear; close all

% Import data for
dataset = readmatrix('dataset.csv');
X = dataset(:, 1:2); y = dataset(:, 3); % for plotting use
X_new = X;

% Standardizing data for giggles just to see the outcome
% May not need to do this at all, perhaps alon when are why you should
% standardize data
stand_X1 = (X(:,1)- mean(X(:,1)))/std(X(:,1));
X_new(:,1) = stand_X1;

stand_X2 = (X(:,2)- mean(X(:,2)))/std(X(:,2));
X_new(:,2) = stand_X2;


%Plotting the original data
plotData(X_new,y)
plotData(X,y)
% Cvpartition to train to the given set
cv = cvpartition(size(dataset,1),'HoldOut',0.3); % randomly distributes the contents by 70%
idx = cv.test;
dataTrain = dataset(~idx,:); %remember tilda ~ means NOT
dataTest  = dataset(idx,:);

train_x = dataTrain(:,1:end-1);
train_y = dataTrain(:, end);

test_x = dataTest(:,1:end-1);
test_y = dataTest(:, end);



