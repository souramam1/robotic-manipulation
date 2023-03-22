clc;
clear all;


theta1_in = pi/2;
alpha1_in = 0; %this will always be 0
alpha2_in = 0;


sim_a3 = [0,pi/2,0];
sim_a4 = [0,pi/2,pi/2];

alpha4_in = 0;

iter_lim = length(sim_a3) - 1;


for i = 1:iter_lim

   
    if sim_a3(i+1) > sim_a3(i)
         a = 0.04;
    elseif sim_a3(i+1) < sim_a3(i)
        a = -0.04;
    else
        a = 0;
    end

  
    for alpha3_in = sim_a3(i):a:sim_a3(i+1)

        if alpha4_in < sim_a4(i+1)

            alpha4_in = alpha4_in + 0.04; 

            % % % % % % Forward Kinematics % % % % % % 
            [T05,T04,T03,T02,T01] = FK(theta1_in,alpha1_in,alpha2_in,alpha3_in,alpha4_in);
   
            j0 = [0,0,0];
            j1 = [T02(1,4),T02(2,4),T02(3,4)];
            j2 = [T03(1,4),T03(2,4),T03(3,4)];
            j3 = [T04(1,4),T04(2,4),T04(3,4)];
            j4 = [T05(1,4),T05(2,4),T05(3,4)];

            % % % % % % % Plot Coordinates % % % % % % %
            plot_FK(j0,j1,j2,j3,j4,T05,T04,T03,T02,T01);
            
            pause(0.001) % for time between drawnow iterations
   
        elseif alpha4_in > sim_a4(i+1)

            alpha4_in = alpha4_in - 0.04; 

            % % % % % % Forward Kinematics % % % % % % 
            [T05,T04,T03,T02,T01] = FK(theta1_in,alpha1_in,alpha2_in,alpha3_in,alpha4_in);
   
            j0 = [0,0,0];
            j1 = [T02(1,4),T02(2,4),T02(3,4)];
            j2 = [T03(1,4),T03(2,4),T03(3,4)];
            j3 = [T04(1,4),T04(2,4),T04(3,4)];
            j4 = [T05(1,4),T05(2,4),T05(3,4)];


            % % % % % % % Plot Coordinates % % % % % % %
            plot_FK(j0,j1,j2,j3,j4,T05,T04,T03,T02,T01);
            
            pause(0.001) % for time between drawnow iterations

        else 
            alpha4_in = sim_a4(i+1);

            % % % % % % Forward Kinematics % % % % % % 
            [T05,T04,T03,T02,T01] = FK(theta1_in,alpha1_in,alpha2_in,alpha3_in,alpha4_in);
   
            j0 = [0,0,0];
            j1 = [T02(1,4),T02(2,4),T02(3,4)];
            j2 = [T03(1,4),T03(2,4),T03(3,4)];
            j3 = [T04(1,4),T04(2,4),T04(3,4)];
            j4 = [T05(1,4),T05(2,4),T05(3,4)];


            % % % % % % % Plot Coordinates % % % % % % %
            plot_FK(j0,j1,j2,j3,j4,T05,T04,T03,T02,T01);
            
            pause(0.01) % for time between drawnow iterations
    
        end
    end
end















