% move to start %
x_start = 100;
y_start = 0;
z_start = 150;
pose_start = 180;

% move to pen above %
x_p = 0;
y_p = 215;
z_p = 150;
pose_p = 90;

% move to pen actual%
x_p2 = 0;
y_p2 = 215;
z_p2 = 40;
pose_p2 = 90;

% move to pen squeeze%
x_p3 = 0;
y_p3 = 215;
z_p3 = 40;
pose_p3 = 90;

% move to pen after%
x_p4 = 0;
y_p4 = 200;
z_p4 = 100;
pose_p4 = 90;

% move to pen after after%
x_p5 = 170;
y_p5 = 0;
z_p5 = 100;
pose_p5 = 160;
X_offset = pose_p5 * -1.4 + 235;

% before 1st line %
x_1 = 200 - X_offset;
y_1 = 60;
z_1 = 70;
pose_1 = pose_p5;

% end of 1st line %
x_2 = 200 - X_offset;
y_2 = 140;
z_2 = 67;
pose_2 = pose_1;

% end of 2nd line %
x_3 = 125 - X_offset;
y_3 = 140;
z_3 = z_2;
pose_3 = pose_1;

% end of 3rd line (diagonal before circle) %
x_4 = 200 - X_offset;
y_4 = 60;
z_4 = 70;
pose_4 = pose_1;



open = 88;
close = 205;

pose = [pose_start, pose_p, pose_p2,pose_p3,pose_p4, pose_p5, pose_1,pose_2,pose_3,pose_4];
x = [x_start,x_p, x_p2, x_p3,x_p4,x_p5, x_1,x_2,x_3,x_4];
y = [y_start, y_p, y_p2, y_p3,y_p4,y_p5, y_1, y_2, y_3, y_4];
z = [z_start, z_p, z_p2, z_p3,z_p4,z_p5, z_1, z_2, z_3, z_4];
gripper = [open, open, open,close,close,close, close, close, close, close];

disp(length(x))
disp(length(y))
disp(length(z))
disp(length(pose))
disp(length(gripper))

for i = 1:6
Move_Cube(pose(i), x(i), y(i), z(i), gripper(i));
end

Linear_Movement(pose, x, y, z, gripper);

circular_movement(pose_4, x_4, y_4, z_4, close, 40, 270, 90);

Move_to_Home();







