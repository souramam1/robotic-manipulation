
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

X_offset = 13;
Y_offset = 3;

% move to pen after after%
x_p5 = 200 + X_offset;
y_p5 =  60 + Y_offset;
z_p5 = 140;
pose_p5 = 90;

% X_offset = pose_p5 * -1.4 + 245;
% Y_offset = pose_p5 * -1.4 + 225;

% before 1st line %
x_1 = 200 + X_offset;% - X_offset
y_1 = 60 + Y_offset;% - Y_offset - ((x_1+X_offset)*-20/75 + 160/3);
z_1 = 78;
pose_1 = pose_p5;
disp(y_1)
% end of 1st line %
x_2 = 200 + X_offset;% - X_offset;
y_2 = 140 + Y_offset + 5;% - Y_offset - ((x_2+X_offset)*-20/75 + 160/3);
z_2 = z_1;
pose_2 = pose_1;
disp(y_2)
% end of 2nd line %
x_3 = 125  + X_offset -5;% - X_offset;
y_3 = 140 + Y_offset;%- Y_offset - ((x_3+X_offset)*-20/75 + 160/3);
z_3 = 80;
pose_3 = pose_1;
disp(y_3)
% end of 3rd line (diagonal before circle) %
x_4 = 200  + X_offset;% - X_offset;
y_4 = 60 + Y_offset;% - Y_offset;
z_4 = z_3;
pose_4 = pose_1;



open = 88;
close = 215;

pose = [pose_p0, pose_p, pose_p2,pose_p3,pose_p4, pose_p5, pose_1,pose_2,pose_3,pose_4];
x = [x_p0, x_p, x_p2, x_p3,x_p4,x_p5, x_1,x_2,x_3,x_4];
y = [y_p0, y_p, y_p2, y_p3,y_p4,y_p5, y_1, y_2, y_3, y_4];
z = [z_p0, z_p, z_p2, z_p3,z_p4,z_p5, z_1, z_2, z_3, z_4];
gripper = [open, open, open,close,close,close, close, close, close, close];
speed = [15, 30, 20, 20, 20, 30, 30, 30, 40, 30];
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



circular_movement(pose_4, x_4, y_4, z_4, close, 40 + 2.5, 270, 90, port_num);

move_cube_task_2(pose_4, x_2, y_2, 130, close, 10, port_num);

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







