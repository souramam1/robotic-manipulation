function [] = move_array_joints(pose, x, y, z, grip, steps)

%----------------------------------------move back to default---------------
for j = 1:length(x)
    time = 3;
    
    [default_theta1, default_alpha2, default_alpha3, default_alpha4] = inverse_kinematics(pose(j), x(j), y(j), z(j));
    
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
end



end




