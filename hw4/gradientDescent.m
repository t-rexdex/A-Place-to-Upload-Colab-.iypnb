%% gradientDescent.m 

function [theta, J_history] = gradientDescent(X,y, theta, alpha, iter)
m = length(y);

J_history = zeros(iter,1);

for idx = 1:iter
    y_pre = X*theta; % h naught
    theta = theta-(alpha*(X.'*(y_pre-y))/m); % gradientDescent equation with the learning rate
    J_history(idx) = computeCost(X,y,theta); % Storing J over time

end

end
