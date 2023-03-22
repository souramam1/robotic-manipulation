clc;
% clear all;

axis = 'x';
pose = 180;


% % % % For tracing with static z % % % 
xz = [210, 210, 10, 10,210];
yz = [-100,95,85,-100,-100];
zz = [-13,-13,0,0,-13];



% % % For tracing with static y % % % 
xy = [0, 0, 100, 100,0];
yy = [-50,-50,-50,-50,-50];
zy = [-2,100,100,-4,-2];

% 
% % % For tracing with static x % % % 
xx = [94, 94, 100, 100,94];
yx = [-97,0,0,-97,-97];
zx = [-5,-5,100,100,-5];



if axis == 'z'
    x = xz;
    y = yz;
    z = zz;
    vertices = verticesz;
elseif axis == 'y'
    x = xy;
    y = yy;
    z = zy;
    vertices = verticesy;
else
    x = xx;
    y = yx;
    z = zx;
    vertices = verticesx;
end


iter_lim = length(x) - 1;
fprintf("iter lim is %f\n", iter_lim);

for j = 1:iter_lim

    steps = 20;
    time = 10;

    [x_des] = cubic_trajectory(x(j), x(j+1), time, steps);
    [y_des] = cubic_trajectory(y(j), y(j+1), time, steps);
    [z_des] = cubic_trajectory(z(j), z(j+1), time, steps);
    fprintf("j is %f\n", j);
    disp(x_des);
    


    for i =  1:steps

    % % % % % take in x y z as inputs to IK % % % % 

    [theta1_deg, alpha2_deg,alpha3_deg,alpha4_deg] = IK_simulations(pose, x_des(i), y_des(i), z_des(i));
    alpha1_in = 0; %this will always be 0


    theta1_in = deg_to_rad(theta1_deg);
    alpha2_in = deg_to_rad(alpha2_deg);
    alpha3_in = deg_to_rad(alpha3_deg);
    alpha4_in = deg_to_rad(alpha4_deg);



    fprintf("theta1_in = %f\n ", theta1_in);
    %fprintf("alpha2_in = %f\n ", alpha2_in);
    %fprintf("alpha3_in = %f\n ", alpha3_in);
    %fprintf("alpha4_in = %f\n ", alpha4_in);


    [T05,T04,T03,T02,T01] = FK(theta1_in,alpha1_in,alpha2_in,alpha3_in,alpha4_in);


    % % % % % take output of IK and feed into plots % % % %

    j0 = [0,0,0];
    j1 = [T02(1,4),T02(2,4),T02(3,4)];
    j2 = [T03(1,4),T03(2,4),T03(3,4)];
    j3 = [T04(1,4),T04(2,4),T04(3,4)];
    j4 = [T05(1,4),T05(2,4),T05(3,4)];

    
    disp(vertices);

    % % % % % % % Plot Coordinates % % % % % % %
    plot_FK_drawsquare(j0,j1,j2,j3,j4,T05,T04,T03,T02,T01);
    pause(0.01) % for time between drawnow iterations


    end
end






















