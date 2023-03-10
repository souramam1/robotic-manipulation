L1 = 76.5;
L2 = sqrt(24^2+128^2);
L3 = 124;
L4 = 146.6;
theta1 = 0;
alpha1 = 0;


thetaoffset = atan(24/128);
disp(thetaoffset);
alpha2_vs = 0;
alpha2 = alpha2_vs + thetaoffset;
alpha3_vs = 0;
alpha3 = alpha3_vs - thetaoffset;
alpha4 = pi/2;
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



T033 = T1*T2*T3; 
T044 = T033 *T4;
T055 = T044 * T5;
%fprintf("T05\n")
disp(T055)