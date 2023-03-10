
%TEST Function to test cubic_trajectory function

% Generate cubic trajectory
[current_theta, desired_theta, total_time] = deal(0, 90, 5);
[theta, dtheta, ddtheta] = cubic_trajectory(current_theta, desired_theta, total_time);

% Print results
disp("Joint angles: ");
disp(theta);
disp("Joint velocities: ");
disp(dtheta);
%disp("Joint accelerations: ");
%disp(ddtheta);

