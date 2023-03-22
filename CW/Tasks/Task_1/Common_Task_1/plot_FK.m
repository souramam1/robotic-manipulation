function [] = plot_FK(j0,j1,j2,j3,j4,T05,T04,T03,T02,T01)
%PLOT Summary of this function goes here
%   Detailed explanation goes here
            

            T00 = [-1,0,0,0;
                    0,1,0,0;
                    0,0,-1,0;
                    0,0,0,0];

            
            grid on;
            xlabel('x-axis');
            ylabel('y-axis');
            zlabel('z-axis');
            plot3([j0(1);j1(1)],[j0(2);j1(2)],[j0(2);j1(3)],'LineWidth',2)
            grid on;
            hold on
            xlabel('x-axis');
            ylabel('y-axis');
            zlabel('z-axis');
            plot3([j1(1);j2(1)],[j1(2);j2(2)],[j1(3);j2(3)],'LineWidth',2)
            grid on;
            hold on
            xlabel('x-axis');
            ylabel('y-axis');
            zlabel('z-axis');
            plot3([j2(1);j3(1)],[j2(2);j3(2)],[j2(3);j3(3)],'LineWidth',2)
            grid on;
            hold on
            xlabel('x-axis');
            ylabel('y-axis');
            zlabel('z-axis');
            plot3([j3(1);j4(1)],[j3(2);j4(2)],[j3(3);j4(3)],'LineWidth',2)
            grid on;
            hold on
            xlabel('x-axis');
            ylabel('y-axis');
            zlabel('z-axis');
            plot_Frames(T05);
            grid on;
            hold on
            xlabel('x-axis');
            ylabel('y-axis');
            zlabel('z-axis');
            plot_Frames(T04);
            grid on;
            hold on
            xlabel('x-axis');
            ylabel('y-axis');
            zlabel('z-axis');
            plot_Frames(T03);
            grid on;
            hold on
            xlabel('x-axis');
            ylabel('y-axis');
            zlabel('z-axis');
            plot_Frames(T02);
            grid on;
            hold on
            xlabel('x-axis');
            ylabel('y-axis');
            zlabel('z-axis');
            grid on;
            plot_Frames(T01);
%             hold on 
%             plot_Frames(T00);
            axis([-300 300 -300 200 0 500])
            hold off
   
            drawnow

end

