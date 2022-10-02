%% main.m
clear
clc

% opengl software

% Load Data
load('dataset.mat');
X = dataset(:, [1,2]); % the first two columns are input variables
y = dataset(:, 3); % the third column of data represents output variable
% 
% %Visualize the dataset
% plotData(X, y); % function defined next page
% hold on;
% % Labels and Legend
% xlabel('Exam 1')
% ylabel('Exam 2')
% % Specified in plot order
% legend('pass = 1', 'not pass = 0')
% hold off;
% 
% Preprocess features with standardization
num_feature = size(X, 2);
mu = zeros(1, num_feature);
sigma = zeros(1, num_feature);


for i=1:num_feature
mu(i) = mean(X(:,i)); 
sigma(i) = std(X(:,i)); 
X(:,i) = (X(:,i) - mu(i))/sigma(i);
end

X = mapFeature(X(:,1), X(:,2)); % becomes 100 x 28 why is this occuring?

theta = ones(size(X,2),1);
iter = 3;
alpha = 0.01;
J = ones(1,iter);
lambda = 5;

for i = 1:iter
    [J(i),grad] = costFunction(theta, X, y, lambda); % why arent you
    
    
    theta = theta-alpha.*grad; % theta updates every iteration
end


% % Plot Decision Boundary
% figure;
% % function defined in next pages
% plotDecisionBoundary(theta, x, y); 
% hold on;
% 
% % Labels and Legend
% xlabel('Exam 1')
% ylabel('Exam 2')
% legend('y = 1', 'y = 0', 'Decision boundary')
% hold off;
% 
% 
% figure;
% plot(1:iter,J);

% p = predict(theta, X);
% fprintf( 'Train Accuracy: %f\n', sum(p == y)) / length(y) );

