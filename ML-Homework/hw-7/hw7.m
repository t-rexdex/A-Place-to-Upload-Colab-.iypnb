%% Naive-bayes-class-ex
clear;clc; close all

% Loading data for preparations
data = readtable('dataset_for_naive_bayes.csv');


figure(1);
isone=(data.y==1);
% plot data with y=1
plot(data.X1(isone),data.X2(isone),'o' ,'MarkerEdgeColor', 'black','MarkerFaceColor', 'green');
hold on
% plot data with y=0
plot(data.X1(~isone),data.X2(~isone),'o' ,'MarkerEdgeColor', 'black','MarkerFaceColor', 'red');
hold off
axis([-.7 .4 -.7 .7]);
xlabel('x_1');
ylabel('x_2');

% Building classifier
class_model = fitcnb(data,'y~X1+X2');
cv = cvpartition(class_model.NumObservations, 'HoldOut',0.3);
cvm = crossval(class_model,'cvpartition',cv);

Predictions_test = predict(cvm.Trained{1}, data(test(cv),1:end-1));
Predictions_train = predict(cvm.Trained{1}, data(training(cv),1:end-1));

accuracy_for_training = sum(data.y(training(cv)) == Predictions_train)/length(Predictions_train)
accuracy_for_test = sum(data.y(test(cv)) == Predictions_test)/length(Predictions_test)
%% Training Plot
labels = unique(data.y);
% labels = unique(data.y); 
classifier_name = 'Naives Bayes (Training)';

X1_range = min(data.X1(training(cv))) - 1:0.01:max(data.X1(training(cv)))+1;
Estimated_y_range = min(data.X2(training(cv)))- 1:0.01:max(data.X2(training(cv)))+1;

figure(2);
% Training Vizualization section
[xx1, xx2] = meshgrid(X1_range,Estimated_y_range);
XGrid = [xx1(:),xx2(:)]; 
predictions_meshgrid = predict(cvm.Trained{1},XGrid);

gscatter(xx1(:),xx2(:),predictions_meshgrid,'rgb');
hold on

training_data = data(training(cv),:);
Y = ismember(training_data.y,labels(1));
scatter(training_data.X1(Y),training_data.X2(Y),'o','MarkerEdgeColor','black','MarkerFaceColor','red');
scatter(training_data.X1(~Y),training_data.X2(~Y),'o','MarkerEdgeColor','black','MarkerFaceColor','green');

xlabel('X1');
ylabel('X2');
title(classifier_name);
legend off,axis tight
legend(int2str(labels),'Location',[0.45, 0.01, 0.45, 0.05],'Orientation', 'Horizontal');
hold off

%% Testing Plot
labels = unique(data.y); 
classifier_name = 'Naives Bayes (Testing)';

X1_range = min(data.X1(test(cv))) - 1:0.01:max(data.X1(test(cv)))+1;
Estimated_y_range = min(data.X2(test(cv)))- 1:0.01:max(data.X2(test(cv)))+1;

figure(3);
% Training Vizualization section
[xx1, xx2] = meshgrid(X1_range,Estimated_y_range);
XGrid = [xx1(:),xx2(:)]; 
predictions_meshgrid = predict(cvm.Trained{1},XGrid);

gscatter(xx1(:),xx2(:),predictions_meshgrid,'rgb');
hold on

test_data = data(test(cv),:);
Y = ismember(test_data.y,labels(1));
scatter(test_data.X1(Y),test_data.X2(Y),'o','MarkerEdgeColor','black','MarkerFaceColor','red');
scatter(test_data.X1(~Y),test_data.X2(~Y),'o','MarkerEdgeColor','black','MarkerFaceColor','green');

xlabel('X1');
ylabel('X2');
title(classifier_name);
legend off,axis tight
legend(int2str(labels),'Location',[0.45, 0.01, 0.45, 0.05],'Orientation', 'Horizontal');
hold off

