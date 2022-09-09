%% Matlab Basic Programming
clc 
close


M = [1,10,6; 2,3,5; 15,9,4]; % Creating M matrix
N = [1,2;6,9;3,7]; % Creating N matrix
A = M(2,:); % Second row of M
B = N(:,1); % First column of N

MxN = M*N;
M_squared = M^2;
N_sqrt = N.^1/2;
BxA=B.*A;

%% Part 2
% Multiply each element in M by 5 using for loop and built in function
M_2 = M;
for i = 1:size(M,1) % for loop to multiply each element in M by 5
    for j = 1:size(M,2)
            M(i,j) = M(i,j)*5;
    end
end


Mx5_2 = M_2*5; % vectorizing to simplify number of calculations


%% Part 3

S = [5,3,8; 2,1,7; 6,4,8];
G = sum(S,1)
F = mean(S,2)


%% Part 4 KNN

% At the moment the code should take in x and y as input and the output
% should be 1 or 0
testx = [30,80]; % build the knn to determine if this passes or fails
trainX = [67; 63; 78; 51; 80; 90; 96; 83; 72; 50]; % part 1 of x
trainY = [30; 79; 82; 48; 65; 61; 15; 22; 67; 60]; % part 2 of x
grade = [0,1,1,0,1,1,0,0,1,0]; % this should be the y 
dist = []; % initializing dist array
placeholder = [];

for i = 1:size(trainX,1)
   dist = [dist; sqrt((trainX(i)-testx(1)).^2+((trainY(i)-testx(2)).^2))]; % currently just outputs a single array
   % need to get this to output with the associated values so that it can
   % be tracked and then sorted
   placeholder = [placeholder; dist(i), trainX(i), trainY(i), grade(i)];
    
end
%dist;
%placeholder;
B = sortrows(placeholder, 1); % sorts array based on the distance  

% Test cases
k = [1,3,5]; % Use 3 values of K where equal to 1, 3, and 5 create another loop in order
% to save these test cases instead of entering k every time


predict_1 = mode(B(k(1),4));
if predict_1 == 1
    predict = 'pass';
else
    predict = 'fail';
end

fprintf('For K = 1 prediction is %s',predict)
fprintf('\n')

predict_2 = mode(B(1:k(2),4));
if predict_2 == 1
    predict = 'pass';
else
    predict = 'fail';
end
fprintf('For K = 3 prediction is %s',predict)
fprintf('\n')

predict_3 = mode(B(1:k(3),4));
if predict_3 == 1
    predict = 'pass';
else
    predict = 'fail';
end
fprintf('For K = 5 prediction is %s',predict)
fprintf('\n')