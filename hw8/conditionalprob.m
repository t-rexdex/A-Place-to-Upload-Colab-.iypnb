%% Practice 
        % x, y, p 
data  = [1,1,.4; 
         1,2,.1;
         2,1,.2; 
         2,2,.3]

%p_1x,2y = 0.5 prob of hot
%p_1x = 0.5 prob of cold
%p_1x or 2y = 0.6 > 0.3+0.1+0.2

% we can shorten the table to p(t) and p(w)
%x, y
%1, 0.5
%2, 0.5

%1, 0.6
%2, 0.4

% think of conditional probability as the soda and candy problem from the
% staquest video. or sun and rain in the ritvikmath

% so going back to this example
% p( 2x | 2y ) = 0.2 / (0.2 + 0.4) = 1/3
% p ( 1x | 2y ) = 0.4 / ( 0.2 + 0.4 ) = 2/3
% p ( 1y | 2x ) = 0.3 / (0.2 + 0.3 ) = 3/5 



%% Let us change the way that the table is structured and begin some normalization 

% the new table becomes 

% X, Y, P
% 1, 1, 0.2
% 1, 2, 0.3
% 2, 1, 0.4
% 2, 2, 0.1

% transforms to P( X | Y2 )
% 1, 2, 0.3
% 2, 2, 0.1

% into .... Remember that normalizing means making the sum into 1!
% 1, .75
% 2, .25




%% New example 
s = [1:6];
a = [1,2,3,4,5];
b = [3,4,5,6];

% given P(a|b) = 3/4 read below

% P(a given b) = 3/6
% assuming that the 3 is the matching amount of variables in a and b
% and P(b) = 4/6




%% An example of using bayes' rule

given that P(w)
R, p
sun, 0.8
rain,0.2

and P(D |w) 
D, W, P
wet, sun, 0.1
dry, sun, 0.7
wet, rain, 0.7
dry, rain, 0.3 

P( W| dry)
w, p
sun, 0.9231
rain, 0.0769


The math becomes  P(sun|dry) = P(dry|sun)*P(sun) / P(dry)
                                0.9* 0.8 / (0.9*0.8 + 50.3*0.2)

                  and for the other example it becomes
                                0.3*0.2 / (0.78) 





