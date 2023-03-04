function [theta, dtheta, ddtheta] = cubic_trajectory(current_theta, desired_theta, total_time, steps)
% CUBIC_TRAJECTORY generates a cubic trajectory for a robot arm
%   [THETA, DTHETA, DDTHETA] = CUBIC_TRAJECTORY(CURRENT_THETA, DESIRED_THETA, TOTAL_TIME)
%   generates a cubic trajectory between the current angle CURRENT_THETA
%   and the desired angle DESIRED_THETA, with a total duration of TOTAL_TIME.
%
%   THETA is a vector of joint angles at each time increment.
%   DTHETA is a vector of joint velocities at each time increment.
%   DDTHETA is a vector of joint accelerations at each time increment.

% Calculate the coefficients of the cubic polynomial
a0 = current_theta;
a1 = 0;
a2 = 3*(desired_theta - current_theta)/(total_time^2);
a3 = -2*(desired_theta - current_theta)/(total_time^3);

% Generate the trajectory
num_steps = steps;
t = linspace(0, total_time, num_steps);
theta = a0 + a1*t + a2*t.^2 + a3*t.^3;
dtheta = a1 + 2*a2*t + 3*a3*t.^2;
ddtheta = 2*a2 + 6*a3*t;

end


