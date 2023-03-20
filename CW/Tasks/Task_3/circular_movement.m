function [] = circular_movement(pose, x, y, z, gripper, radius, start_angle, end_angle, port_num)
% Read the position of the dynamixel horn with the torque off
% The code executes for a given amount of time then terminates




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
DEVICENAME                  = '/dev/tty.usbserial-FT6RW7G5';       % Check which port is being used on your controller
                                            % ex) Windows: 'COM1'   Linux: '/dev/ttyUSB0' Mac: '/dev/tty.usbserial-*'
                                            
TORQUE_ENABLE               = 1;            % Value for enabling the torque
TORQUE_DISABLE              = 0;            % Value for disabling the torque
DXL_MINIMUM_POSITION_VALUE  = -150000;      % Dynamixel will rotate between this value
DXL_MAXIMUM_POSITION_VALUE  = 150000;       % and this value (note that the Dynamixel would not move when the position value is out of movable range. Check e-manual about the range of the Dynamixel you use.)
DXL_MOVING_STATUS_THRESHOLD = 20;           % Dynamixel moving status threshold

ESC_CHARACTER               = 'e';          % Key for escaping loop

COMM_SUCCESS                = 0;            % Communication Success result value
COMM_TX_FAIL                = -1001;        % Communication Tx Failed

%% ------------------ %%


write4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID1, ADDR_PRO_PROFILE_ACCELERATION, 10);
write4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID1, ADDR_PRO_PROFILE_VELOCITY, 200);
write4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID2, ADDR_PRO_PROFILE_ACCELERATION, 10);
write4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID2, ADDR_PRO_PROFILE_VELOCITY, 200);
write4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID3, ADDR_PRO_PROFILE_ACCELERATION, 10);
write4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID3, ADDR_PRO_PROFILE_VELOCITY, 200);
write4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID4, ADDR_PRO_PROFILE_ACCELERATION, 10);
write4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID4, ADDR_PRO_PROFILE_VELOCITY, 200);
%--------------------------------SINE MOVING--------------------------------
% sine function
%     steps = 400;
%     t = linspace(0,2*pi,steps);
%     y = 500*sin(t);
%     y = y + 2046; % center the sine wave around 2046 encoder counts
%     z = -500*sin(t);
%     z = z + 2046;

%     for i = 1:steps
%        
%        write4ByteTxRx(port_num,PROTOCOL_VERSION, DXL_ID1, ADDR_PRO_GOAL_POSITION, typecast(int32(round(y(i))), 'uint32'));
%        write4ByteTxRx(port_num,PROTOCOL_VERSION, DXL_ID2, ADDR_PRO_GOAL_POSITION, typecast(int32(round(z(i))), 'uint32'));
%        %pause(0.001);
%     end
%----------------------------------------move linear---------------

steps = 60;
time = 3;

Dx_in1 = [];
Dx_in2 = [];
Dx_in3 = [];
Dx_in4 = [];
Dx_in5 = [];


    
[x_des, y_des] = circle_trajectory(radius, x, y, time, steps, start_angle, end_angle);


% dxl_present_position5 = read4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID5, ADDR_PRO_PRESENT_POSITION);
% 
% encoder_to_degree = 360/4096;
% 
% deg5_current = dxl_present_position5* encoder_to_degree;
% 
% [alpha5_close] = cubic_trajectory(deg5_current, gripper(j), time, steps);

% for i = 1:steps
%     Dx_in5 = (alpha5_close(i))*4096/360;
%     write4ByteTxRx(port_num,PROTOCOL_VERSION, DXL_ID5, ADDR_PRO_GOAL_POSITION, typecast(int32(Dx_in5), 'uint32'));
% end

for i = 1:steps

    [theta1_des, alpha2_des, alpha3_des, alpha4_des] = inverse_kinematics(pose, x_des(i), y_des(i), z);
    
    Dx_in1(i) = (theta1_des + 90)*4096/360;
    Dx_in2(i) = (alpha2_des + 180)*4096/360;
    Dx_in3(i) = (alpha3_des + 90)*4096/360;
    Dx_in4(i) = (alpha4_des + 180)*4096/360;

        
end



for i = 1:steps
    if i == 1
        fprintf("IN MOVEMENT FOR LOOP");
    end
    write4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID1, ADDR_PRO_GOAL_POSITION, typecast(int32(real(Dx_in1(i))), 'uint32'));
    write4ByteTxRx(port_num,PROTOCOL_VERSION, DXL_ID2, ADDR_PRO_GOAL_POSITION, typecast(int32(real(Dx_in2(i))), 'uint32'));
    write4ByteTxRx(port_num,PROTOCOL_VERSION, DXL_ID3, ADDR_PRO_GOAL_POSITION, typecast(int32(real(Dx_in3(i))), 'uint32'));
    write4ByteTxRx(port_num,PROTOCOL_VERSION, DXL_ID4, ADDR_PRO_GOAL_POSITION, typecast(int32(real(Dx_in4(i))), 'uint32'));
end
% Generate a set of points along the line with an exponential spacing





end



