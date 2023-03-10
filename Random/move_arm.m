function [] = move_arm(theta1_cur,alpha2_cur, alpha3_cur, alpha4_cur, theta1_des, alpha2_des, alpha3_des, alpha4_des, steps, time)
%MOVE_ARM Summary of this function goes here
%   Detailed explanation goes here

DXL_ID1                      = 11;            % Dynamixel ID: 1
DXL_ID2                      = 12;
DXL_ID3                      = 13;
DXL_ID4                      = 14;


DEVICENAME                  = 'COM11';  
PROTOCOL_VERSION            = 2.0;   
port_num = portHandler(DEVICENAME);
ADDR_PRO_GOAL_POSITION       = 116; 

[current_theta, desired_theta, total_time] = deal(theta1_cur, theta1_des, time);
[theta1, dtheta1, ddtheta1] = cubic_trajectory(current_theta, desired_theta, total_time, steps);

[current_theta, desired_theta, total_time] = deal(alpha2_cur, alpha2_des, time);
[alpha2, dalpha2, ddalpha2] = cubic_trajectory(current_theta, desired_theta, total_time, steps);

[current_theta, desired_theta, total_time] = deal(alpha3_cur, alpha3_des, time);
[alpha3, dalpha3, ddalpha3] = cubic_trajectory(current_theta, desired_theta, total_time, steps);

[current_theta, desired_theta, total_time] = deal(alpha4_cur, alpha4_des, time);
[alpha4, dalpha4, ddalpha4] = cubic_trajectory(current_theta, desired_theta, total_time, steps);


for i = 1:steps
    Dx_in1 = (theta1(i) + 90)*4096/360;
    Dx_in2 = (alpha2(i) + 180)*4096/360;
    Dx_in3 = (alpha3(i) + 90)*4096/360;
    Dx_in4 = (alpha4(i) + 180)*4096/360;
    write4ByteTxRx(port_num,PROTOCOL_VERSION, DXL_ID1, ADDR_PRO_GOAL_POSITION, typecast(int32(Dx_in1), 'uint32'));
    write4ByteTxRx(port_num,PROTOCOL_VERSION, DXL_ID2, ADDR_PRO_GOAL_POSITION, typecast(int32(Dx_in2), 'uint32'));
    write4ByteTxRx(port_num,PROTOCOL_VERSION, DXL_ID3, ADDR_PRO_GOAL_POSITION, typecast(int32(Dx_in3), 'uint32'));
    write4ByteTxRx(port_num,PROTOCOL_VERSION, DXL_ID4, ADDR_PRO_GOAL_POSITION, typecast(int32(Dx_in4), 'uint32'));
end

end

