function [alpha] = forward(V,a,b,pi)
    N = size(a,1);
    T = size(V,1);
    alpha = zeros(T,N);

    alpha(1,:) = pi.*b(:,V(1)+1)';

    for t = 2:T
        for j = 1:N
            alpha(t,j) = (alpha(t-1,:)*a(:,j))*b(j,V(t)+1);
        end
    end

end