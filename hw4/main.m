clear
clc

load('dataset.mat');
m = length(dataset(:,1));
X = [ones(m,1), dataset(:,1)];
x = dataset(:,1);
y = dataset(:,2);% separating the x and the y of the dataset
figure(1);
scatter(x,y,"filled") % did this just to see the layout of the data
title('Plotted dataset')
xlabel('x')
ylabel('y')

iter = 2500; % max number of iterations for calculating gradient descent
alpha = .01; % learning rate fo gradient descent



% Need to define the starting theta
theta = zeros(size(X,2),1);
[theta, J] = gradientDescent(X,y, theta, alpha, iter); %currently theta is not updating why?

fprintf('The calculated thetas are as follows:\n')
fprintf('\n%f\n%f',theta(1),theta(2))

figure(2);
scatter(x,y,"filled")
title('With linear regression equation')
xlabel('x')
ylabel('y')


hold on;
plot(X(:,2), X * theta, '-');
hold off;

figure(3);
plot(1: iter, J, '-b');
title('J vs Iteration$s ')