function [T05,T04,T03,T02,T01] = FK(theta1, alpha1, alpha2, alpha3, alpha4)
%FK Summary of this function goes here
%   Detailed explanation goes here
            L1 = 76.5;
            %L2 = 128;
            L2 = sqrt(24^2+128^2);
            L3 = 124;
            L4 = 146.6;

            thetaoffset = atan(24/128);

            alpha2 = alpha2 + thetaoffset;
            alpha3 = alpha3 - thetaoffset;


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
    
            T01 = T1;
            T02 = T1* T2;
            T03 = T1*T2*T3; 
            T04 = T03*T4;
            T05 = T04 * T5;

end

