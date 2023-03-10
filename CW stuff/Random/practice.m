% Define the x, y, and z data
x = [0 1];
y = [0 1];
z = [0 0];

% Define the number of rotation steps
steps = 100;

% Define the rotation angle (in radians)
angle = 2 * pi / steps;

% Use a for loop to rotate the X and Y lines
for i = 1:steps
    clf
    % Calculate the new X and Y data
    new_x = x * cos(i * angle) - y * sin(i * angle);
    new_y = x * sin(i * angle) + y * cos(i * angle);
    
    % Plot the new X and Y lines
    plot3(new_x, new_y, z, 'r', 'LineWidth', 2, 'DisplayName', 'X-axis');
    hold on;
    plot3(z, new_x, new_y, 'g', 'LineWidth', 2, 'DisplayName', 'Y-axis');
    
    % Plot the Z-axis
    plot3([0 0], [0 0], [0 1], 'b', 'LineWidth', 2, 'DisplayName', 'Z-axis');
    
    % Set the axis limits to [0,1] in all directions
    axis([-1 1 -1 1 0 1])
    
    % Add labels for the axes
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    
    % Update the plot
    drawnow;
end
