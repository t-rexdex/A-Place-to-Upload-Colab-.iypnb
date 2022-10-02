function p = predict(theta, X)

m = size(X,1);

p = zeros(m,1);

y_p = SigMoid(X*theta);
for i = 1:m
    if (y_p(i)>=0.5)
        p(i) = 1;
    else
        p(i) = 0;
        nd
    end
end

