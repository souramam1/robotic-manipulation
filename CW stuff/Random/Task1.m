% Define the x, y, and z data
x = [0 1];
y = [0 1];
z = [0 1];

%clear plot
clf

%---------------------0-------------------------------- Plot the x-axis in red
plot3([0 0.6], [0 0], [0 0], 'r', 'LineWidth', 2, 'DisplayName', 'X0-axis'); hold on;

% Plot the y-axis in green
plot3([0 0], [0 0.6], [0 0], 'g', 'LineWidth', 2, 'DisplayName', 'Y0-axis');

% Plot the z-axis in blue
plot3([0 0], [0 0], [0 1], 'k', 'LineWidth', 2, 'DisplayName', 'Z0-axis');
% 
% % --------------1----------------------------- Plot the new x-axis in yellow and add a label
 plot3([0 0.6], [0 0], [1 0.8], 'r', 'LineWidth', 2, 'DisplayName', 'X1-axis (new)');
% 
% % Plot the new y-axis in magenta and add a label
plot3([0 0], [0 0.6], [1 0.8], 'm', 'LineWidth', 2, 'DisplayName', 'Y1-axis (new)');
% 
% % Plot the new z-axis in cyan and add a label
plot3([0 0.8], [0 .8], [1 2], 'k', 'LineWidth', 2, 'DisplayName', 'Z1-axis (new)');


    % % % -----------------2------------------------Plot the new x-axis in yellow and add a label
    %  plot3([0.8 1.2], [0 0], [2 1.8], 'r', 'LineWidth', 2, 'DisplayName', 'X2-axis (new)');
    % % 
    % % % Plot the new y-axis in magenta and add a label
    % plot3([0 0], [0.8 1.2], [2 1.8], 'm', 'LineWidth', 2, 'DisplayName', 'Y2-axis (new)');
    % % 
    % % % Plot the new z-axis in cyan and add a label
    % plot3([0.8 1.8], [0.8 1.8], [2 3], 'k', 'LineWidth', 2, 'DisplayName', 'Z2-axis (new)');
    % % 
    % % % Set the axis limits to [0,1] in all directions
    % % axis([0 1 0 1 0 1])

% Set the axis limits to [0,1] in all directions
axis([-5 5 -5 5 -5 5])

% Add labels for the axes
xlabel('X');
ylabel('Y');
zlabel('Z');



% Enable rotation on the 3D plot
rotate3d on;

% Add a legend to the plot
legend('show');
% 
% % Define the number of rotation steps
% steps = 100;
% 
% % Define the rotation angle (in degrees)
% angle = 360 / steps;
% 
% % Use a for loop to rotate the axis around the X-Y plane
% for i = 1:steps
%     view(i * angle, 30);
%     drawnow;
% end
