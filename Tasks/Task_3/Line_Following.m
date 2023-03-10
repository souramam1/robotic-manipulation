pose = [180, 180, 180];
x = [100, 125, 125];
y = [0, 125, -25];
z = [100, 63, 63];
% gripper = [];



Move_to_Start(pose(1), x(1), y(1), z(1));

Linear_Movement(pose, x, y, z);


Move_to_Home();







