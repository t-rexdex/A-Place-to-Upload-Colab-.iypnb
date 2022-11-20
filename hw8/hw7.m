clc; clear; close all
%% Problem 2 
states = ['Sunny', 'Rainy','Overcast'];
n_states = length(states);
observations = ['Dry','Wet'];
n_observations = length(observations);
start_probability = [ 0.4, 0.3, 0.3];
transition_probability = [ 0.3, 0.3, 0.4; 0.3, 0.2, 0.5; 0.4, 0.5, 0.1];
emission_probability = [0.7, 0.3; 0.1, 0.9; 0.5, 0.5];

%%

states = ['Sunny', 'Rainy','Overcast'];
n_states = length(states);
observations = ['Dry','Wet'];
n_observations = length(observations);
start_probability = [ 0.4, 0.3, 0.3];
transition_probability = [ 0.3, 0.3, 0.4; 0.3, 0.2, 0.5; 0.4, 0.5, 0.1];
emission_probability = [0.7, 0.3; 0.1, 0.9; 0.5, 0.5];


% sample sequence of observation
sequence_of_observation2 = [1 0 1 1 0];


% sequence of observation = wet, dry, wet, wet, dry 
alpha = forward(sequence_of_observation2, transition_probability, emission_probability, start_probability);
probability = sum(alpha(end,:));

fprintf('The probability of the Problem 2.3 sequence is: %f\n', probability)

%% Decoding
states = ["Sunny", "Rainy","Overcast"];
n_states = length(states);
observations = ["Dry","Wet"];
n_observations = length(observations);
start_probability = [ 0.4, 0.3, 0.3];
transition_probability = [ 0.3, 0.3, 0.4; 0.3, 0.2, 0.5; 0.4, 0.5, 0.1];
emission_probability = [0.7, 0.3; 0.1, 0.9; 0.5, 0.5];


bob_says= [2 1 2 2 1];

estimatedStates = hmmviterbi(bob_says, transition_probability, emission_probability);
fprintf("\nThe solution for Problem 2.4 is the following:")
fprintf("The given sequence: %s %s %s %s %s \n", observations(bob_says(1)), observations(bob_says(2)),observations(bob_says(3)), observations(bob_says(4)), observations(bob_says(5)))
fprintf("The hidden states of the given sequence: %s %s %s %s %s \n", states(estimatedStates(1)),states(estimatedStates(2)) ,states(estimatedStates(3)),states(estimatedStates(4)), states(estimatedStates(5)))

