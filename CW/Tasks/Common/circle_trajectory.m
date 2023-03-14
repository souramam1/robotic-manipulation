function [X,Y] = circle_trajectory(radius, x0, y0, total_time, steps, start_angle, end_angle)

x_centre = x0 - radius * cosd(start_angle);

y_centre = y0 - radius * sind(start_angle);
% Calculate the coefficients of the cubic polynomial
a0 = start_angle;
a1 = 0;
a2 = 3*(end_angle - start_angle)/(total_time^2);
a3 = -2*(end_angle - start_angle)/(total_time^3);

% Generate the trajectory
num_steps = steps;
t = linspace(0, total_time, num_steps);
theta = real(a0 + a1*t + a2*t.^2 + a3*t.^3);


X = x_centre + radius * cosd(theta);
Y = y_centre + radius * sind(theta);
end

