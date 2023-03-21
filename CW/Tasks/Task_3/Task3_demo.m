
x_p0 = 140;
y_p0 = 0;
z_p0 = 200;
pose_p0 = 90;

% move to pen above %
x_p = 0;
y_p = 155;
z_p = 200;
pose_p = 90;

% move to pen actual%
x_p2 = 0;
y_p2 = y_p;
z_p2 = 75;
pose_p2 = 180;

% move to pen squeeze%
x_p3 = 0;
y_p3 = y_p2;
z_p3 = z_p2;
pose_p3 = pose_p2;

% move to pen after%
x_p4 = 0;
y_p4 = 140;
z_p4 = 230;
pose_p4 = pose_p3;

% OFFSET
X_offset = 12;
Y_offset = 20;

% move to pen above 1st line %
x_p5 = 100 + X_offset;
y_p5 =  175 + Y_offset;
z_p5 = 170;
pose_p5 = 90;

% start of 1st line %
x_1 = 100 + X_offset;
y_1 = 175 + Y_offset;
z_1 = 89;
pose_1 = pose_p5;

% end of 1st line  (end of long vertical) %
x_2 = 200 + X_offset + 10;
y_2 = 175 + Y_offset + 1;
z_2 = z_1;
pose_2 = pose_1;

% end of 2nd line (diagonal) %
x_3 = 150  + X_offset -1;
y_3 = 125 + Y_offset - 11;
z_3 = z_1 - 5; 
pose_3 = pose_1;


% end of 3rd line (horizontal before circle) %
x_4 = 150  + X_offset + 3;
y_4 = 175 + Y_offset;
z_4 = z_1 + 1;
pose_4 = pose_1;


open = 88;
close = 215;

pose = [pose_p0, pose_p, pose_p2,pose_p3,pose_p4, pose_p5, pose_1,pose_2,pose_3,pose_4];
x = [x_p0, x_p, x_p2, x_p3,x_p4,x_p5, x_1,x_2,x_3,x_4];
y = [y_p0, y_p, y_p2, y_p3,y_p4,y_p5, y_1, y_2, y_3, y_4];
z = [z_p0, z_p, z_p2, z_p3,z_p4,z_p5, z_1, z_2, z_3, z_4];
gripper = [open, open, open,close,close,close, close, close, close, close];
speed = [15, 30, 20, 20, 20, 30, 50, 80, 60, 60];
% disp(length(x))
% disp(length(y))
% disp(length(z))
% disp(length(pose))
% disp(length(gripper))

port_num = setup();
for i = 1:length(x)
    if i >= 7
        Linear_with_steps(pose(i), x(i), y(i), z(i), gripper(i), speed(i), x(i-1), y(i-1), z(i-1), port_num);
    else
        move_cube_task_2(pose(i), x(i), y(i), z(i), gripper(i), speed(i), port_num);
    end
    pause(0.2)
end


% circular_movement(pose, x, y, z, gripper, radius, start_angle, end_angle, port_num)
circular_movement(pose_4, x_4, y_4, z_4-2, close, 25 + 3, -180, 90, port_num); % change circle angles

move_cube_task_2(pose_4, 175 + X_offset, 200 + Y_offset, 130, close, 5, port_num);

%hover above
x_1 = -2;
y_1 = 155;
z_1 = 200;
pose_1 = 180;

%go down
x_2 = x_1;
y_2 = y_1;
z_2 = 83;
pose_2 = 180;

%open
x_3 = x_2;
y_3 = y_2;
z_3 = z_2;
pose_3 = 180;

%go back up
x_4 = x_3;
y_4 = y_3;
z_4 = 200;
pose_4 = 180;

xx = [x_1, x_2, x_3, x_4];
yy = [y_1, y_2, y_3, y_4];
zz = [z_1, z_2, z_3, z_4];
posepose = [pose_1, pose_2, pose_3, pose_4];
grippp = [close, close, open, open];
speeddd = [30, 30, 10, 20];

for i = 1:length(xx)
    move_cube_task_2(posepose(i), xx(i), yy(i), zz(i), grippp(i), speeddd(i), port_num);
end

Move_to_Home(port_num);







