z_vert = 10;
z_end = 10;
port_num = setup();
%-------start positions of cubes ---------
start_x1 = 180;
start_y1 = -180;
start_z1 = z_vert+3;
start_p1 = 160;
start_g1 = close;

start_x2 = 175;
start_y2 = 50;
start_z2 = z_vert;
start_p2 = 175;
start_g2 = close;

start_x3 = 0;
start_y3 = 175;
start_z3 = z_vert;
start_p3 = 175;
start_g3 = close;

%--------------End positions of cubes--------

end_x1 = 0;
end_y1 = -147;
end_z1 = z_end-7;
end_p1 = 165;
end_g1 = close;


end_x2 = 96;
end_y2 = -96;
end_z2 = z_end - 7;
end_p2 = 180;
end_g2 = close;


end_x3 = 230;
% end_y3 = 100;
end_y3 = 0;
end_z3 = z_end - 4;
end_p3 = 180;
end_g3 = close;

open = 88;
close = 215;
%------------hover above----------
[pose1_hov,x1_hov,y1_hov,z1_hov,grip_1_hov] = hover_above(start_p1,start_x1,start_y1,start_z1,start_g1); 
[end_pose1_hov,end_x1_hov,end_y1_hov,end_z1_hov,end_grip_1_hov] = hover_above(end_p1,end_x1,end_y1,end_z1,end_g1); 
%-------fill arrays
for i = 1:3
    Cpose_1 = [pose1_hov,start_p1,start_p1,pose1_hov, end_pose1_hov, end_p1, end_p1, end_pose1_hov];
    Cx_1 = [x1_hov,start_x1,start_x1,x1_hov, end_x1_hov, end_x1, end_x1 end_x1_hov];
    Cy_1 = [y1_hov,start_y1,start_y1,y1_hov, end_y1_hov, end_y1, end_y1, end_y1_hov];
    Cz_1 = [z1_hov,start_z1,start_z1,z1_hov, end_z1_hov, end_z1, end_z1, end_z1_hov];
    Cgripper_1 = [open,open,close,close, close, close, open, open];
    C_steps_1 = [20, 30, 10, 20, 20, 30, 10, 20];
end

for i = 1:8
    move_cube_task_2(Cpose_1(i), Cx_1(i), Cy_1(i), Cz_1(i), Cgripper_1(i), C_steps_1(i), port_num);
    pause(0.3)
end


%------------hover above----------
[pose2_hov,x2_hov,y2_hov,z2_hov,grip_2_hov] = hover_above(start_p2,start_x2,start_y2,start_z2,start_g2); 
[end_pose2_hov,end_x2_hov,end_y2_hov,end_z2_hov,end_grip_2_hov] = hover_above(end_p2,end_x2,end_y2,end_z2,end_g2); 
%-------fill arrays
for i = 1:3
    Cpose_2 = [pose2_hov,start_p2,start_p2,pose2_hov, end_pose2_hov, end_p2, end_p2, end_pose2_hov];
    Cx_2 = [x2_hov,start_x2,start_x2,x2_hov, end_x2_hov, end_x2, end_x2 end_x2_hov];
    Cy_2 = [y2_hov,start_y2,start_y2,y2_hov, end_y2_hov, end_y2, end_y2, end_y2_hov];
    Cz_2 = [z2_hov,start_z2,start_z2,z2_hov, end_z2_hov, end_z2, end_z2, end_z2_hov];
    Cgripper_2 = [open,open,close,close, close, close, open, open];
    C_steps_2 = [40, 30, 10, 20, 20, 30, 10, 20];
end

for i = 1:8
    move_cube_task_2(Cpose_2(i), Cx_2(i), Cy_2(i), Cz_2(i), Cgripper_2(i), C_steps_2(i), port_num);
    pause(0.3)
end



%------------hover above----------
[pose3_hov,x3_hov,y3_hov,z3_hov,grip_3_hov] = hover_above(start_p3,start_x3,start_y3,start_z3,start_g3); 
[end_pose3_hov,end_x3_hov,end_y3_hov,end_z3_hov,end_grip_3_hov] = hover_above(end_p3,end_x3,end_y3,end_z3,end_g3); 
%-------fill arrays
for i = 1:3
    Cpose_3 = [pose3_hov,start_p3,start_p3,pose3_hov, end_pose3_hov, end_p3, end_p3, end_pose3_hov];
    Cx_3 = [x3_hov,start_x3,start_x3,x3_hov, end_x3_hov, end_x3, end_x3 end_x3_hov];
    Cy_3 = [y3_hov,start_y3,start_y3,y3_hov, end_y3_hov, end_y3, end_y3, end_y3_hov];
    Cz_3 = [z3_hov,start_z3,start_z3,z3_hov, end_z3_hov, end_z3, end_z3, end_z3_hov];
    Cgripper_3 = [open,open,close,close, close, close, open, open];
    C_steps_3 = [40, 30, 20, 20, 20, 30, 10, 20];
end

for i = 1:8
    move_cube_task_2(Cpose_3(i), Cx_3(i), Cy_3(i), Cz_3(i), Cgripper_3(i), C_steps_3(i), port_num);
    pause(0.3)
end



%Move_to_Place(180, 100, 0, 100, close);

Move_to_Home(port_num);

clearvars;
