function [] = move_joints_no_cubic(alpha4, x, y, z, grip, steps, port_num)

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






write4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID4, ADDR_PRO_PROFILE_ACCELERATION, 0);
write4ByteTxRx(port_num, PROTOCOL_VERSION, DXL_ID4, ADDR_PRO_PROFILE_VELOCITY, 0);

disp(alpha4)




Dx_in4 = (alpha4 + 180)*4096/360;
disp(Dx_in4)
write4ByteTxRx(port_num,PROTOCOL_VERSION, DXL_ID4, ADDR_PRO_GOAL_POSITION, typecast(int32(Dx_in4), 'uint32'));




close all;
clear all;

end




