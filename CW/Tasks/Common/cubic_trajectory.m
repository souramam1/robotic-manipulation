function [theta] = cubic_trajectory(current_theta, desired_theta, total_time, steps)
% CUBIC_TRAJECTORY generates a cubic trajectory for a robot arm


% Calculate the coefficients of the cubic polynomial
a0 = current_theta;
a1 = 0;
a2 = 3*(desired_theta - current_theta)/(total_time^2);
a3 = -2*(desired_theta - current_theta)/(total_time^3);

% Generate the trajectory
num_steps = steps;
t = linspace(0, total_time, num_steps);
theta = real(a0 + a1*t + a2*t.^2 + a3*t.^3);


end


