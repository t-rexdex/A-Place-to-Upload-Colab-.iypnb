%% computeCost.m
function J = computeCost(X, y, theta)

% Initialize some useful values
m = length(y); % number of training examples

J = 0; %

y_pre = X*theta;
J = sum((y_pre-y).^2)/(2*m);

end
