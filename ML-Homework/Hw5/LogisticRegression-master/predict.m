function p = predict(theta, X)
%PREDICT Predict whether the label is 0 or 1 using learned logistic 
%regression parameters theta
%   p = PREDICT(theta, X) computes the predictions for X using a 
%   threshold at 0.5 (i.e., if sigmoid(theta'*x) >= 0.5, predict 1)

% Number of training examples
m = size(X, 1);

p = sigmoid(X * theta);

% p as a discrete number
pos = find(p >= 0.5);
neg = find(p < 0.5);
p(pos) = 1; p(neg) = 0;

end
