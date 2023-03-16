function [] = move_cube_task_2(pose, x, y, z, grip, steps, port_num)

%% ---- Control Table Addresses ---- %%

ADDR_PRO_TORQUE_ENABLE       = 64;           % Control table address is different in Dynamixel model
ADDR_PRO_GOAL_POSITION       = 116; 
ADDR_PRO_PRESENT_POSITION    = 132; 
ADDR_PRO_OPERATING_MODE      = 11;
ADDR_PRO_PROFILE_VELOCITY      = 112;
ADDR_PRO_PROFILE_ACCELERATION = 108;
%% ---- Other Settings ---- %%

% Protocol version
PROTOCOL_VERSION            = 2.0;          % See which protocol version is used in the Dynamixel

% Default setting
DXL_ID1                      = 11;            % Dynamixel ID: 1
DXL_ID2                      = 12;
DXL_ID3                      = 13;
DXL_ID4                      = 14;
DXL_ID5                      = 15;

BAUDRATE                    = 115200;
% DEVICENAME                  = '/dev/tty.usbserial-FT5NSOFA';       % Check which port is being used on your controller
                                            %FT5WJ63F ex) Windows: 'COM1'   Linux: '/dev/ttyUSB0' Mac: '/dev/tty.usbserial-*'
                                            
TORQUE_ENABLE               = 1;            % Value for enabling the torque
TORQUE_DISABLE              = 0;            % Value for disabling the torque
DXL_MINIMUM_POSITION_VALUE  = -150000;      % Dynamixel will rotate between this value
DXL_MAXIMUM_POSITION_VALUE  = 150000;       % and this value (note that the Dynamixel would not move when the position value is out of movable range. Check e-manual about the range of the Dynamixel you use.)
DXL_MOVING_STATUS_THRESHOLD = 20;           % Dynamixel moving status threshold

ESC_CHARACTER               = 'e';          % Key for escaping loop

COMM_SUCCESS                = 0;            % Communication Success result value
COMM_TX_FAIL                = -1001;        % Communication Tx Failed

%% ------------------ %%

% Initialize PortHandler Structs
% Set the port path
% Get methods and members of PortHandlerLinux or PortHandlerWindows
% port_num = portHandler(DEVICENAME);


%----------------------------------------move back to default---------------
%CHANGE TO 15 FOR CUBES 
time = 3;
% Default angles
% default_theta1 = 90;
% default_alpha2 = -65.478516;
% default_alpha3 = 94.218750;
% default_alpha4 = 60.908203;
% default_alpha5 = 230;

[default_theta1, default_alpha2, default_alpha3, default_alpha4] = inverse_kinematics(pose, x, y, z);

default_alpha5 = grip;
% Coordinates:
% x   99.6667
% 
% y    0.1529
% 
% z  259.5405
% 
% pose   90.0879

% Read present position
dxl_present_position1 = read4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID1, ADDR_PRO_PRESENT_POSITION);
dxl_present_position2 = read4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID2, ADDR_PRO_PRESENT_POSITION);
dxl_present_position3 = read4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID3, ADDR_PRO_PRESENT_POSITION);
dxl_present_position4 = read4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID4, ADDR_PRO_PRESENT_POSITION);
dxl_present_position5 = read4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID5, ADDR_PRO_PRESENT_POSITION);

% conversion factors from encoder count to radian and degree
encoder_to_degree = 360/4096;

% convert encoder counts to angles in degrees
deg1 = dxl_present_position1 * encoder_to_degree -90;
deg2 = dxl_present_position2* encoder_to_degree -180;
deg3 = dxl_present_position3* encoder_to_degree -90;
deg4 = dxl_present_position4* encoder_to_degree -180;
deg5 = dxl_present_position5* encoder_to_degree;

theta1_cur = deg1;
alpha2_cur = deg2;
alpha3_cur = deg3;
alpha4_cur = deg4;
alpha5_cur = deg5;

theta1_des = default_theta1;
alpha2_des = default_alpha2;
alpha3_des = default_alpha3;
alpha4_des = default_alpha4;
alpha5_des = default_alpha5;


write4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID1, ADDR_PRO_PROFILE_ACCELERATION, 10);
write4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID1, ADDR_PRO_PROFILE_VELOCITY, 200);
write4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID2, ADDR_PRO_PROFILE_ACCELERATION, 10);
write4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID2, ADDR_PRO_PROFILE_VELOCITY, 200);
write4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID3, ADDR_PRO_PROFILE_ACCELERATION, 10);
write4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID3, ADDR_PRO_PROFILE_VELOCITY, 200);
write4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID4, ADDR_PRO_PROFILE_ACCELERATION, 10);
write4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID4, ADDR_PRO_PROFILE_VELOCITY, 200);

%move_arm(theta1_cur, alpha2_cur, alpha3_cur, alpha4_cur, theta1_des, alpha2_des, alpha3_des, alpha4_des, steps, time);

[current_theta, desired_theta, total_time] = deal(theta1_cur, theta1_des, time);
[theta1] = cubic_trajectory(current_theta, desired_theta, total_time, steps);

[current_theta, desired_theta, total_time] = deal(alpha2_cur, alpha2_des, time);
[alpha2] = cubic_trajectory(current_theta, desired_theta, total_time, steps);

[current_theta, desired_theta, total_time] = deal(alpha3_cur, alpha3_des, time);
[alpha3] = cubic_trajectory(current_theta, desired_theta, total_time, steps);

[current_theta, desired_theta, total_time] = deal(alpha4_cur, alpha4_des, time);
[alpha4] = cubic_trajectory(current_theta, desired_theta, total_time, steps);

[current_theta, desired_theta, total_time] = deal(alpha5_cur, alpha5_des, time);
[alpha5] = cubic_trajectory(current_theta, desired_theta, total_time, steps);


for i = 1:steps
    Dx_in1 = (theta1(i) + 90)*4096/360;
    Dx_in2 = (alpha2(i) + 180)*4096/360;
    Dx_in3 = (alpha3(i) + 90)*4096/360;
    Dx_in4 = (alpha4(i) + 180)*4096/360;
    Dx_in5 = (alpha5(i))*4096/360;
    write4ByteTxRx(port_num,PROTOCOL_VERSION, DXL_ID1, ADDR_PRO_GOAL_POSITION, typecast(int32(Dx_in1), 'uint32'));
    write4ByteTxRx(port_num,PROTOCOL_VERSION, DXL_ID2, ADDR_PRO_GOAL_POSITION, typecast(int32(Dx_in2), 'uint32'));
    write4ByteTxRx(port_num,PROTOCOL_VERSION, DXL_ID3, ADDR_PRO_GOAL_POSITION, typecast(int32(Dx_in3), 'uint32'));
    write4ByteTxRx(port_num,PROTOCOL_VERSION, DXL_ID4, ADDR_PRO_GOAL_POSITION, typecast(int32(Dx_in4), 'uint32'));
    write4ByteTxRx(port_num,PROTOCOL_VERSION, DXL_ID5, ADDR_PRO_GOAL_POSITION, typecast(int32(Dx_in5), 'uint32'));
    
end



close all;
clear all;

end


