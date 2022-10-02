%% plotDecisionBoundary
function plotDecisionBoundary(theta, X, y)
 
% Plot Data
plotData(X(:,2:3), y);
hold on
 


if size(X, 2) <= 3 %  , n+1<=3. In our dataset, n+1=3
    % although size(X, 2) <= 3, below code only apply to size(X, 2) = 3
    % Only need 2 points to define a line, so choose two endpoints
    plot_x = [min(X(:,2))-2,  max(X(:,2))+2];
 
    % Calculate the decision boundary
    plot_y = (-1./theta(3)).*(theta(2).*plot_x + theta(1));
 
    % Plot, and adjust axes for better viewing
    plot(plot_x, plot_y)
    
    % Legend, specific for the exercise
    legend('1', '0', 'Decision Boundary')
    axis([30, 100, 30, 100])
    
    else %  , n+1>3
    % Here is the grid range
    u = linspace(-1, 1.25, 50);%-1~1.25, 50 elements
    v = linspace(-1, 1.25, 50);
 
    z = zeros(length(u), length(v));
    % Evaluate z = theta*x over the grid
    for i = 1:length(u)
        for j = 1:length(v)
            z(i,j) = mapFeature(u(i), v(j))*theta;
        end
    end
    z = z'; % important to transpose z before calling contour
 
    % Plot z = 0
    % Notice you need to specify the range [0, 0], which means z=0
    contour(u, v, z, [0 0], 'LineWidth', 3)
end
hold off
 
end
 