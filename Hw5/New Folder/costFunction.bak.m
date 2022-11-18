function [J, grad] = costFunction(theta, X, y, lambda)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.
J =0;
% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
% J_cost = 0;
grad = zeros(size(theta));

h = SigMoid(X*theta); % Getting zeros WHYYYYY

% calculate Cost
J = (1/m) * sum(-y .* log(h)-(1-y) .* log(1-h)) + (lambda/(2 * m)) * sum(theta(2:end).^2);
grad = (1/m * X' * (h - y)) + [0;(lambda/m) * theta(2:end)];

% =============================================================

end
