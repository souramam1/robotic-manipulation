L1 = 76.5;
L2 = sqrt(24^2+128^2);
L3 = 124;
L4 = 146.6;
thetaoffset = atan(24/128);
% disp(thetaoffset);

theta1degg = 179.121094;
alpha2_vsdegg = -9.931641;
alpha3_vsdegg = 147.832031;
alpha4degg = -46.933594;



theta1 = theta1degg*pi/180;
alpha2_vs = alpha2_vsdegg*pi/180;
alpha3_vs = alpha3_vsdegg*pi/180;
alpha4 = alpha4degg*pi/180;
total = alpha2_vs + alpha3_vs +alpha4;
if(total < 0)
    total = total + 2*pi;
end
alpha1 = 0;
if(alpha2_vs < 0)
    alpha2_vs = alpha2_vs + 2*pi;
end
alpha2 = alpha2_vs + thetaoffset;

if(alpha3_vs < 0)
    alpha3_vs = alpha3_vs + 2*pi;
end
alpha3 = alpha3_vs - thetaoffset;
alpha2_before = alpha2*180/pi;
alpha3_before = alpha3*180/pi;
% fprintf("alpha2 before %f\n", alpha2_before);
% fprintf("alpha3 before %f\n", alpha3_before);


T1 = [cos(theta1) , -sin(theta1), 0, 0;
       sin(theta1) , cos(theta1), 0, 0;
       0           ,           0, 1, 0;
       0           ,           0, 0, 1;
       ];


T2 = [ 1,           0,            0,               0;
        0, cos(alpha1), -sin(alpha1), -sin(alpha1)*L1;
        0, sin(alpha1),  cos(alpha1), cos(alpha1)*L1;
        0,           0,            0,               1;
        ];



T3 = [ 1,           0,            0,               0;
        0, cos( alpha2), -sin( alpha2), -sin( alpha2)*L2;
        0, sin( alpha2),  cos( alpha2), cos( alpha2)*L2;
        0,           0,            0,               1;
     ];

T4 = [ 1,           0,            0,               0;
        0, cos( alpha3), -sin( alpha3), -sin( alpha3)*L3;
        0, sin( alpha3),  cos( alpha3), cos( alpha3)*L3;
        0,           0,            0,               1;
     ];

T5 = [ 1,           0,            0,               0;
        0, cos(alpha4),            -sin(alpha4),               -sin(alpha4)*L4;
        0, sin(alpha4),            cos(alpha4),               cos(alpha4)*L4;
        0,           0,            0,               1;
     ];



T033 = T1*T2*T3; 
T044 = T033 *T4;
T055 = T044 * T5;
x = T055(1, 4);
y = T055(2, 4);
z = T055(3, 4);
% disp(T055)
% total = alpha2 + alpha3 + alpha4;
total_deg = total*180/pi;

disp(x)
disp(y)
disp(z)
disp(total_deg)