% move to start %
x_start = 100;
y_start = 0;
z_start = 100;
pose_start = 180;

% move to pen above %
x_p = 0;
y_p = 225;
z_p = 100;
pose_p = 90;

% move to pen actual%
x_p2 = 0;
y_p2 = 225;
z_p2 = 40;
pose_p2 = 90;

% move to pen squeeze%
x_p3 = 0;
y_p3 = 225;
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
pose_p5 = 90;

% before 1st line %
x_1 = 175;
y_1 = 0;
z_1 = 75;
pose_1 = 180;

% end of 1st line %
x_2 = 175;
y_2 = -50;
z_2 = z_1;
pose_2 = pose_1;

% end of 2nd line %
x_3 = 125;
y_3 = -50;
z_3 = z_1;
pose_3 = pose_1;

% end of 3rd line (diagonal before circle) %
x_4 = 175;
y_4 = -100;
z_4 = z_1;
pose_4 = pose_1;

% end of circle %
x_5 = 125;
y_5 = -150;
z_5 = z_1;
pose_5 = pose_1;


open = 88;
close = 215;

pose = [pose_start, pose_p, pose_p2,pose_p3,pose_p4, pose_1,pose_2,pose_3,pose_4,pose_5];
x = [x_start,x_p, x_p2, x_p3,x_p4,x_p5, x_1,x_2,x_3,x_4,x_5];
y = [y_start, y_p, y_p2, y_p3,y_p4,y_p5, y_1, y_2, y_3, y_4, y_5];
z = [z_start, z_p, z_p2, z_p3,z_p4,z_p5, z_1, z_2, z_3, z_4, z_5];
gripper = [open, open, open,close,close,close, close, close, close, close, close];

for i = 1:6
Move_to_Place(pose(i), x(i), y(i), z(i), gripper(i));
end

Linear_Movement(pose, x, y, z, gripper);

Move_to_Home();







