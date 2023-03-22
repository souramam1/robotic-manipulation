z_vert = 23;
z_end = 59;

[port_num] = setup();
pause_time = 0.2;

%-------start positions of cubes ---------
start_x1 = 75 + 7;
start_y1 = -200 - 12;
start_z1 = z_vert - 1;
start_p1 = 175;
start_g1 = close;

start_x2 = 225 + 15;
start_y2 = 0;
start_z2 = z_vert - 5;
start_p2 = 175;
start_g2 = close;

start_x3 = 150 + 8;
start_y3 = 150 + 8;
start_z3 = z_vert + 4;
start_p3 = 175;
start_g3 = close;

%--------------End positions of cubes--------

end_x1 = 71;
end_y1 = -190;
end_z1 = z_end;
end_p1 = 90;
end_g1 = close;

end_x2 = 215 - 2 - 3;
end_y2 = 0;
end_z2 = z_end - 10;
end_p2 = 90;
end_g2 = close;

end_x3 = 140;
end_y3 = 143;
end_z3 = z_end;
end_p3 = 90;
end_g3 = close;

open = 88;
close = 215;
%------------hover above----------
[pose1_hov,x1_hov,y1_hov,z1_hov,grip_1_hov] = hover_above(start_p1,start_x1,start_y1,start_z1,start_g1);
[end_pose1_hov,end_x1_hov,end_y1_hov,end_z1_hov,end_grip_1_hov] = hover_above_back(start_p1,end_x1,end_y1,end_z1,end_g1); 
%-------fill arrays

Cpose_1 = [pose1_hov,start_p1,start_p1,pose1_hov, end_pose1_hov, end_p1, end_p1, end_pose1_hov];
Cx_1 = [x1_hov,start_x1,start_x1,x1_hov, end_x1_hov, end_x1, end_x1 end_x1_hov];
Cy_1 = [y1_hov,start_y1,start_y1,y1_hov, end_y1_hov, end_y1, end_y1, end_y1_hov];
Cz_1 = [z1_hov,start_z1,start_z1,z1_hov, end_z1_hov, end_z1, end_z1, end_z1_hov];
Cgripper_1 = [open,open,close,close, close, close, open, open];
Cspeed_1 = [25, 20, 10, 15, 15, 30, 3, 15];


% for i = 1:8
%     if i == 6
%         Linear_with_steps(Cpose_1(i), Cx_1(i), Cy_1(i), Cz_1(i), Cgripper_1(i), Cspeed_1(i), Cx_1(i-1), Cy_1(i-1), Cz_1(i-1), port_num)
%     else
%         move_cube_task_2(Cpose_1(i), Cx_1(i), Cy_1(i), Cz_1(i), Cgripper_1(i), Cspeed_1(i), port_num);
%     end
%     pause(pause_time)
% end


%------------hover above----------
[pose2_hov,x2_hov,y2_hov,z2_hov,grip_2_hov] = hover_above(start_p2,start_x2,start_y2,start_z2,start_g2); 
[end_pose2_hov,end_x2_hov,end_y2_hov,end_z2_hov,end_grip_2_hov] = hover_above_back(start_p2,end_x2,end_y2,end_z2,end_g2); 
%-------fill arrays

Cpose_2 = [pose2_hov,start_p2,start_p2,pose2_hov, end_pose2_hov, end_p2, end_p2, end_pose2_hov];
Cx_2 = [x2_hov,start_x2,start_x2,x2_hov, end_x2_hov, end_x2, end_x2 end_x2_hov];
Cy_2 = [y2_hov,start_y2,start_y2,y2_hov, end_y2_hov, end_y2, end_y2, end_y2_hov];
Cz_2 = [z2_hov,start_z2,start_z2,z2_hov, end_z2_hov, end_z2, end_z2, end_z2_hov];
Cgripper_2 = [open,open,close,close, close, close, open, open];
Cspeed_2 = [25, 20, 10, 15, 15, 30, 3, 15];

for i = 1:8
    if i == 6
        Linear_with_steps(Cpose_2(i), Cx_2(i), Cy_2(i), Cz_2(i), Cgripper_2(i), Cspeed_2(i), Cx_2(i-1), Cy_2(i-1), Cz_2(i-1), port_num)
    else
        move_cube_task_2(Cpose_2(i), Cx_2(i), Cy_2(i), Cz_2(i), Cgripper_2(i), Cspeed_2(i), port_num);
    end
    pause(pause_time)
end


%------------hover above----------
[pose2_hov,x2_hov,y2_hov,z2_hov,grip_2_hov] = hover_above(start_p2,start_x2,start_y2,start_z2,start_g2); 
[end_pose2_hov,end_x2_hov,end_y2_hov,end_z2_hov,end_grip_2_hov] = hover_above_back(start_p2,end_x2,end_y2,end_z2,end_g2); 
%-------fill arrays

Cpose_2 = [pose2_hov,start_p2,start_p2,pose2_hov, end_pose2_hov, end_p2, end_p2, end_pose2_hov];
Cx_2 = [x2_hov,start_x2,start_x2,x2_hov, end_x2_hov, end_x2, end_x2 end_x2_hov];
Cy_2 = [y2_hov,start_y2,start_y2,y2_hov, end_y2_hov, end_y2, end_y2, end_y2_hov];
Cz_2 = [z2_hov,start_z2,start_z2,z2_hov, end_z2_hov, end_z2, end_z2, end_z2_hov];
Cgripper_2 = [open,open,close,close, close, close, open, open];
Cspeed_2 = [25, 20, 10, 15, 15, 30, 3, 15];

% 
% for i = 1:8
%     if i == 6
%         Linear_with_steps(Cpose_2(i), Cx_2(i), Cy_2(i), Cz_2(i), Cgripper_2(i), Cspeed_2(i), Cx_2(i-1), Cy_2(i-1), Cz_2(i-1), port_num)
%     else
%         move_cube_task_2(Cpose_2(i), Cx_2(i), Cy_2(i), Cz_2(i), Cgripper_2(i), Cspeed_2(i), port_num);
%     end
%     pause(pause_time)
% end




%------------hover above----------
[pose3_hov,x3_hov,y3_hov,z3_hov,grip_3_hov] = hover_above(start_p3,start_x3,start_y3,start_z3,start_g3); 
[end_pose3_hov,end_x3_hov,end_y3_hov,end_z3_hov,end_grip_3_hov] = hover_above_back(start_p3,end_x3,end_y3,end_z3,end_g3); 
%-------fill arrays

Cpose_3 = [pose3_hov,start_p3,start_p3,pose3_hov, end_pose3_hov, end_p3, end_p3, end_pose3_hov];
Cx_3 = [x3_hov,start_x3,start_x3,x3_hov, end_x3_hov, end_x3, end_x3 end_x3_hov];
Cy_3 = [y3_hov,start_y3,start_y3,y3_hov, end_y3_hov, end_y3, end_y3, end_y3_hov];
Cz_3 = [z3_hov,start_z3,start_z3,z3_hov, end_z3_hov, end_z3, end_z3, end_z3_hov];
Cgripper_3 = [open,open,close,close, close, close, open, open];
Cspeed_3 = [25, 20, 10, 15, 15, 30, 3, 15];


% for i = 1:8
%     if i == 6
%         Linear_with_steps(Cpose_3(i), Cx_3(i), Cy_3(i), Cz_3(i), Cgripper_3(i), Cspeed_3(i), Cx_3(i-1), Cy_3(i-1), Cz_3(i-1), port_num);
% 
%     else
%         move_cube_task_2(Cpose_3(i), Cx_3(i), Cy_3(i), Cz_3(i), Cgripper_3(i), Cspeed_3(i), port_num);
%     end
%     pause(pause_time)
% end

% % % % % % % % % % % % % % % NOW STACKING

% stack_start_x3 = 150 + 8;
% stack_start_y3 = 150 + 8;
% stack_start_z3 = z_vert + 4;
% stack_start_p3 = 175;
% stack_start_g3 = close;

stack_end_x1 = 125 + 6;
stack_end_y1 = 0;
stack_end_z1 = z_vert + 50 - 20;
stack_end_p1 = 175;
stack_end_g1 = close;

stack_end_x2 = 125 + 6;
stack_end_y2 = 0 ;
stack_end_z2 = z_vert + 25 - 20 + 2;
stack_end_p2 = 175;
stack_end_g2 = close;

stack_end_x3 = 125 + 0;
stack_end_y3 = 0;
stack_end_z3 = z_vert - 20;
stack_end_p3 = 175;
stack_end_g3 = close;


%------------hover above----------
[pose3_hov,x3_hov,y3_hov,z3_hov,grip_3_hov] = hover_above(start_p3,start_x3,start_y3,start_z3,start_g3); 
[stack_end_p3_hov,stack_end_x3_hov,stack_end_y3_hov,stack_end_z3_hov,stack_end_g3_hov] = hover_above(stack_end_p3,stack_end_x3,stack_end_y3,stack_end_z3,stack_end_g3); 
%-------fill arrays

Cpose_3 = [pose3_hov,start_p3,start_p3,pose3_hov, stack_end_p3_hov, stack_end_p3, stack_end_p3, stack_end_p3_hov];
Cx_3 = [x3_hov,start_x3,start_x3, x3_hov, stack_end_x3_hov, stack_end_x3, stack_end_x3, stack_end_x3_hov];
Cy_3 = [y3_hov,start_y3,start_y3, y3_hov, stack_end_y3_hov, stack_end_y3, stack_end_y3, stack_end_y3_hov];
Cz_3 = [z3_hov,start_z3,start_z3, z3_hov, stack_end_z3_hov, stack_end_z3, stack_end_z3, stack_end_z3_hov];
Cgripper_3 = [open,open,close,close, close, close, open, open];
Cspeed_3 = [25, 20, 10, 15, 15, 30, 3, 15];


for i = 1:8
    disp(i)
    if i == 6
        Linear_with_steps(Cpose_3(i), Cx_3(i), Cy_3(i), Cz_3(i), Cgripper_3(i), Cspeed_3(i), Cx_3(i-1), Cy_3(i-1), Cz_3(i-1), port_num);

    else
        move_cube_task_2(Cpose_3(i), Cx_3(i), Cy_3(i), Cz_3(i), Cgripper_3(i), Cspeed_3(i), port_num);
    end
    pause(pause_time)
end

%------------hover above----------
[pose2_hov,x2_hov,y2_hov,z2_hov,grip_2_hov] = hover_above(start_p2,start_x2,start_y2,start_z2,start_g2); 
[stack_end_p2_hov,stack_end_x2_hov,stack_end_y2_hov,stack_end_z2_hov,stack_end_g2_hov] = hover_above(stack_end_p2,stack_end_x2,stack_end_y2,stack_end_z2,stack_end_g2); 
%-------fill arrays

Cpose_2 = [pose2_hov,start_p2,start_p2,pose2_hov, stack_end_p2_hov, stack_end_p2, stack_end_p2, stack_end_p2_hov];
Cx_2 = [x2_hov,start_x2,start_x2, x2_hov, stack_end_x2_hov, stack_end_x2, stack_end_x2, stack_end_x2_hov];
Cy_2 = [y2_hov,start_y2,start_y2, y2_hov, stack_end_y2_hov, stack_end_y2, stack_end_y2, stack_end_y2_hov];
Cz_2 = [z2_hov,start_z2,start_z2, z2_hov, stack_end_z2_hov, stack_end_z2, stack_end_z2, stack_end_z2_hov];
Cgripper_2 = [open,open,close,close, close, close, open, open];
Cspeed_2 = [25, 20, 10, 15, 15, 30, 3, 15];


for i = 1:8
    disp(i)
    if i == 6
        Linear_with_steps(Cpose_2(i), Cx_2(i), Cy_2(i), Cz_2(i), Cgripper_2(i), Cspeed_2(i), Cx_2(i-1), Cy_2(i-1), Cz_2(i-1), port_num);

    else
        move_cube_task_2(Cpose_2(i), Cx_2(i), Cy_2(i), Cz_2(i), Cgripper_2(i), Cspeed_2(i), port_num);
    end
    pause(pause_time)
end

%------------hover above----------
[pose1_hov,x1_hov,y1_hov,z1_hov,grip_1_hov] = hover_above(start_p1,start_x1,start_y1,start_z1,start_g1); 
[stack_end_p1_hov,stack_end_x1_hov,stack_end_y1_hov,stack_end_z1_hov,stack_end_g1_hov] = hover_above(stack_end_p1,stack_end_x1,stack_end_y1,stack_end_z1,stack_end_g1); 
%-------fill arrays

Cpose_1 = [pose1_hov,start_p1,start_p1,pose1_hov, stack_end_p1_hov, stack_end_p1, stack_end_p1, stack_end_p1_hov];
Cx_1 = [x1_hov,start_x1,start_x1, x1_hov, stack_end_x1_hov, stack_end_x1, stack_end_x1, stack_end_x1_hov];
Cy_1 = [y1_hov,start_y1,start_y1, y1_hov, stack_end_y1_hov, stack_end_y1, stack_end_y1, stack_end_y1_hov];
Cz_1 = [z1_hov,start_z1+4,start_z1+4, z1_hov, stack_end_z1_hov, stack_end_z1, stack_end_z1, stack_end_z1_hov];
Cgripper_1 = [open,open,close,close, close, close, open, open];
Cspeed_1 = [25, 20, 10, 15, 15, 30, 3, 15];


for i = 1:8
    disp(i)
    if i == 6
        Linear_with_steps(Cpose_1(i), Cx_1(i), Cy_1(i), Cz_1(i), Cgripper_1(i), Cspeed_1(i), Cx_1(i-1), Cy_1(i-1), Cz_1(i-1), port_num);

    else
        move_cube_task_2(Cpose_1(i), Cx_1(i), Cy_1(i), Cz_1(i), Cgripper_1(i), Cspeed_1(i), port_num);
    end
    pause(pause_time)
end


Move_to_Home(port_num);

clearvars;
