%% Initialization
clear ; close all; clc

%% Load Data
%  The first two columns contains the exam scores and the third column
%  contains the label.
load('dataset.mat');
X = dataset(:, 1:2); y = dataset(:, 3);

%  We start by first plotting the data to understand the 
%  the problem we are working with.
%
% fprintf(['Plotting data with + indicating (y = 1) examples and o ' ...
%          'indicating (y = 0) examples.\n']);
% 
% % call the plot function
% plotData(X, y);
% 
% % Put some labels 
% hold on;
% % Labels and Legend
% xlabel('Exam 1 score')
% ylabel('Exam 2 score')
% 
% % Specified in plot order
% legend('Pass', 'Fail')
% hold off;
% Preprocess features with standardization
num_feature = size(X, 2);% number of features for a sample = 2
mu = zeros(1, num_feature); 
sigma = zeros(1, num_feature);
for i=1:num_feature
mu(i) = mean(X(:,i));
sigma(i) = std(X(:,i)); 
X(:,i) = (X(:,i) - mu(i))/sigma(i);
end

% Add Polynomial Features 
% Note that mapFeature also adds a column of ones for us
X = mapFeature(X(:,1), X(:,2));

% Set Options
theta= ones(size(X,2),1); % initialize theta (28 by 1)
iterations=3; % number of iterations
J=ones(1, iterations); %define array J to save the cost before each    iteration.
alpha=0.01; % learning rate

% Optimize, for each iteration, compute the current cost and gradient , then update theta.
for i=1: iterations
     [J(i), grad] = costFunction(theta, X, y); %compute the current cost and gradient, (function defined next page)
     theta=theta-alpha.*grad; % update theta via gradient descent
end

