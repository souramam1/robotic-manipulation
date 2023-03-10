clc;
clear all;

L1 = 76.5;
L2 = 128;
L3 = 124;
L4 = 146.6;
theta1 = 0;
alpha1 = 0; %this will always be 0
alpha2 = 0;
% alpha3 = pi/2;
% alpha4 = pi/2;


sim_a3 = [0,pi/2,0,-pi/2];
sim_a4 = [0,pi/2,pi/2,0];

alpha4 = 0;
iter_lim = length(sim_a3) - 1;

for i = 1:3

    for alpha3 = sim_a3(i):0.01:sim_a3(i+1)
        
        if alpha4 < sim_a4(i+1)

    
            alpha4 = alpha4 + 0.01;
    
            T1 = [[cos(theta1) , -sin(theta1), 0, 0;
           sin(theta1) , cos(theta1), 0, 0;
           0           ,           0, 1, 0;
           0           ,           0, 0, 1;
           ]];
    
            T2 = [[ 1,           0,            0,               0;
                    0, cos(alpha1), -sin(alpha1), -sin(alpha1)*L1;
                    0, sin(alpha1),  cos(alpha1), cos(alpha1)*L1;
                    0,           0,            0,               1;
                    ]];
            
            T3 = [[ 1,           0,            0,               0;
                    0, cos( alpha2), -sin( alpha2), -sin( alpha2)*L2;
                    0, sin( alpha2),  cos( alpha2), cos( alpha2)*L2;
                    0,           0,            0,               1;
                 ]];
            
            T4 = [[ 1,           0,            0,               0;
                    0, cos( alpha3), -sin( alpha3), -sin( alpha3)*L3;
                    0, sin( alpha3),  cos( alpha3), cos( alpha3)*L3;
                    0,           0,            0,               1;
                 ]];
            
            T5 = [[ 1,           0,            0,               0;
                    0, cos(alpha4),            -sin(alpha4),               -sin(alpha4)*L4;
                    0, sin(alpha4),            cos(alpha4),               cos(alpha4)*L4;
                    0,           0,            0,               1;
                 ]];
    
    
            T02 = T1* T2;
            T03 = T1*T2*T3; 
            T04 = T03*T4;
            T05 = T04 * T5;
    
            j0 = [0,0,0];
            j1 = [T02(1,4),T02(2,4),T02(3,4)];
            j2 = [T03(1,4),T03(2,4),T03(3,4)];
            j3 = [T04(1,4),T04(2,4),T04(3,4)];
            j4 = [T05(1,4),T05(2,4),T05(3,4)];
    
            plot3([j0(1);j1(1)],[j0(2);j1(2)],[j0(2);j1(3)],'-o','LineWidth',2)
            hold on
            plot3([j1(1);j2(1)],[j1(2);j2(2)],[j1(3);j2(3)],'-o','LineWidth',2)
            hold on
            plot3([j2(1);j3(1)],[j2(2);j3(2)],[j2(3);j3(3)],'-o','LineWidth',2)
            hold on
            plot3([j3(1);j4(1)],[j3(2);j4(2)],[j3(3);j4(3)],'-o','LineWidth',2)
            axis([-300 200 -300 200 0 500])
            hold off
   
            drawnow
            pause(0.01)

            disp("value of alpha3 is")
            disp(alpha3)
            disp("value of alpha4 is")
            disp(alpha4)
            disp("T05 has value")
            disp(T05)
            disp("i has value")
            disp(i)
    
        end
    
    end
end















