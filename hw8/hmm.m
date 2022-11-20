clc; clear; close all

states = ['Sunny','Rainy'];
n_states = length(states);
observations = ['H','G'];
n_observations = length(observations);
start_probability = [ 0.2, 0.8];
transition_probability = [ 0.8, 0.2; 0.4, 0.6];
emission_probability = [0.8,0.4;0.2,0.6];


% sample sequence of observation
sequence_of_observation1 = 0;
sequence_of_observation2 = [0;1];


% sequence of observation = 'walk' 
alpha1 = forward(sequence_of_observation1, transition_probability, emission_probability, start_probability);
probability1 = sum(alpha1(end,:));


% sequence of observation = 'walk' 
alpha2 = forward(sequence_of_observation2, transition_probability, emission_probability, start_probability);
probability2 = sum(alpha2(end,:));

fprintf('%f\n', probability1)
fprintf('%f\n', probability2)

%% Decoding
states = ["Rainy","Sunny"];
n_states = length(states);
observations = ["walk","shop","clean"];
n_observations = length(observations);
start_probability = [ 0.6, 0.4];
transition_probability = [ 0.7, 0.3; 0.4, 0.6];
emission_probability = [0.1,0.4,0.5;0.6,0.3,0.1];

bob_says=[1 2 3];

estimatedStates = hmmviterbi(bob_says, transition_probability, emission_probability);
fprintf("Bob says: %s %s %s\n", observations(bob_says(1)), observations(bob_says(2)),observations(bob_says(3)))
fprintf("Alice hears: %s %s %s\n", states(estimatedStates(1)),states(estimatedStates(2)) ,states(estimatedStates(3)))

