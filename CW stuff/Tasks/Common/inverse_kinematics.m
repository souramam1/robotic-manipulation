function [theta_1_deg, alpha2_deg, alpha3_deg, alpha4_deg] = inverse_kinematics(pose_deg, x, y, z)
%INVERSE_KINEMATICS Summary of this function goes here
%   Detailed explanation goes here
% INPUT X,Y,Z and POSE of end EFFECTOR

pose_rad = pose_deg*pi/180;

% Lengths CONSIDERING offsets
L1 = 76.5;
L2_short = 128;
Loff = 24;
L2 = sqrt(L2_short^2 + Loff^2);
L3 = 124;
L4 = 146.6;

ang_offset = atan(Loff/L2_short);
ang_offset_deg = ang_offset*180/pi;
% fprintf("ang_offset = %f\n",ang_offset_deg);

p_tot = sqrt(x^2 + y^2);

%calibration for offset
z_offset = 27 - 8/106.1*(p_tot);
% fprintf("z_offset %f\n", z_offset);
z = z - z_offset;

%%%

z_tot = z - L1;
% fprintf("p_tot =  %f\n", p_tot);
% fprintf("z_tot =  %f\n", z_tot);


p2 = p_tot - L4*sin(pose_rad);
z2 = z_tot - L4*cos(pose_rad);
% fprintf("p2 =  %f\n", p2);
% fprintf("z2 =  %f\n", z2);


% ANGLES RADIANS (unless specified otherwise in this section)

% theta1
theta_1_deg = atan(y/x)*180/pi + 90;

% alpha3
alpha3_up = (acos(((p2^2+z2^2) - (L2^2 + L3^2))/(2*L2*L3)));

%beta
beta_up = atan((L3*sin(alpha3_up))/(L2 + L3*cos(alpha3_up)));
% fprintf("beta_up =  %f\n", beta_up);

% gamma
if p2 >= 0 && z2 >= 0
    gamma = atan(p2/z2);
elseif p2 <= 0 && z2 >= 0
    gamma = atan(p2/z2);
else
    gamma = pi + atan(p2/z2);
end
% fprintf("gamma =  %f\n", gamma);

% alpha2
alpha2_in_calc_rad = gamma-beta_up;


% ANGLES in DEGREES

alpha3_deg = (acos(((p2^2+z2^2) - (L2^2 + L3^2))/(2*L2*L3)))*180/pi;
alpha2_in_calc_deg = (gamma-beta_up)*180/pi;

alpha2_deg = alpha2_in_calc_deg - ang_offset_deg;
alpha4_deg = pose_deg - alpha3_deg - alpha2_deg;


% This is the alpha 2 that needs to be fed in but calculating the correct
% alpha 4 requires using the offsetted alpha2

% alpha4 not w offset
% alpha4_deg = pose_deg - alpha3_deg - alpha2_in_calc_deg;
% alpha2_deg = alpha2_in_calc_deg - ang_offset_deg;

% BOUNDS ON ALPHAS 
% alpha2_lb = -120.4;
% alpha2_ub = 110.917;
% alpha3_lb = -28.65;(physiologically) --> 10.61965528 (mathematically)
% alpha3_ub = 178.24;
% alpha4_lb = -105.73;
% alpha4_ub = 124.62;
% 
% fprintf("theta1_deg %f\n", theta_1_deg);
% fprintf("alpha2_deg %f\n", alpha2_deg);
% fprintf("alpha3_deg %f\n", alpha3_deg);
% fprintf("alpha4_deg %f\n", alpha4_deg);
end

