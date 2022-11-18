function plotData(X, y)
% Plots the data points X and y into a figure

% Create New Figure
figure; hold on;
 
%pos contains the index of y=1, neg contains the index of y=0
pos = find(y==1); neg = find(y == 0);

% Plot Examples, marker ‘×’ is pass, marker ‘  ’ is not pass
plot(X(pos, 1), X(pos, 2), 'rx','LineWidth', 2, 'MarkerSize', 7);
plot(X(neg, 1), X(neg, 2), 'bo', 'MarkerFaceColor', 'b','MarkerSize', 7);
hold off;
 
end

