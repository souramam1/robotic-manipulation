% % % Define start position
% % namex_1 = 0;
% % namey_1 = 0;
% % namez_1 = 150;
% % 
% % % Define letter size
% % letter_size = 50;
% % 
% % % Generate coordinates for first line of A
% % namex_2 = namex_1 + letter_size/2;
% % namey_2 = namey_1 + letter_size;
% % namez_2 = namez_1;
% % 
% % % Generate coordinates for second line of A
% % namex_3 = namex_2 + letter_size/2;
% % namey_3 = namey_2 - letter_size;
% % namez_3 = namez_2;
% % 
% % % Generate coordinates for third line of A
% % namex_4 = namex_3 - letter_size/4;
% % namey_4 = namey_2 - letter_size/2;
% % namez_4 = namez_3;
% % 
% % namex_5 = namex_4 - letter_size/2;
% % namey_5 = namey_4;
% % namez_5 = namez_4;
% % 
% % 
% % % Plot the lines of the letter A
% % plot3([namex_1 namex_2],[namey_1 namey_2],[namez_1 namez_2],'k','LineWidth',2);
% % hold on;
% % plot3([namex_2 namex_3],[namey_2 namey_3],[namez_2 namez_3],'k','LineWidth',2);
% % plot3([namex_3 namex_4],[namey_3 namey_4],[namez_3 namez_4],'k','LineWidth',2);
% % plot3([namex_4 namex_5],[namey_4 namey_5],[namez_4 namez_5],'k','LineWidth',2);
% % 
% % % Set axis limits and labels
% % axis equal;
% % xlabel('X');
% % ylabel('Y');
% % zlabel('Z');
% % xlim([-100 100]);
% % ylim([-100 100]);
% % zlim([0 200]);
% % 
% % % Set plot title
% % title('Letter A');
% % 
% % clear all;
% 
% % Define start position
% name_x1 = 0;
% name_y1 = 0;
% name_z1 = 150;
% 
% % Define letter size
% letter_size = 50;
% 
% % Generate coordinates for first line of B
% name_x2 = name_x1;
% name_y2 = name_y1 + letter_size;
% name_z2 = name_z1;
% 
% % Generate coordinates for second line of B
% name_x3 = name_x2 + letter_size/2;
% name_y3 = name_y2 - letter_size/4;
% name_z3 = name_z2;
% 
% % Generate coordinates for third line of B
% name_x4 = name_x3 - letter_size/2;
% name_y4 = name_y3 - letter_size/4;
% name_z4 = name_z3;
% 
% % Generate coordinates for fourth line of B
% name_x5 = name_x4 + letter_size/2;
% name_y5 = name_y4 - letter_size/4;
% name_z5 = name_z4;
% 
% % Generate coordinates for fifth line of B
% name_x6 = name_x5 - letter_size/2;
% name_y6 = name_y5 - letter_size/4;
% name_z6 = name_z5;
% 
% 
% % Plot the lines of the letter B
% plot3([name_x1 name_x2],[name_y1 name_y2],[name_z1 name_z2],'k','LineWidth',2);
% hold on;
% plot3([name_x2 name_x3],[name_y2 name_y3],[name_z2 name_z3],'k','LineWidth',2);
% plot3([name_x3 name_x4],[name_y3 name_y4],[name_z3 name_z4],'k','LineWidth',2);
% plot3([name_x4 name_x5],[name_y4 name_y5],[name_z4 name_z5],'k','LineWidth',2);
% plot3([name_x5 name_x6],[name_y5 name_y6],[name_z5 name_z6],'k','LineWidth',2);
% 
% % Set axis limits and labels
% axis equal;
% xlabel('X');
% ylabel('Y');
% zlabel('Z');
% xlim([-100 100]);
% ylim([-100 100]);
% zlim([0 200]);
% 
% % Set plot title
% title('Letter B');

% % Define start position
% name_x1 = 0;
% name_y1 = 0;
% name_z1 = 150;
% 
% % Define letter size
% letter_size = 50;
% 
% % Generate coordinates for first line of C
% name_x2 = name_x1 + letter_size;
% name_y2 = name_y1;
% name_z2 = name_z1;
% 
% % Generate coordinates for second line of C
% name_x3 = name_x2 - letter_size;
% name_y3 = name_y2;
% name_z3 = name_z2;
% 
% % Generate coordinates for third line of C
% name_x4 = name_x3;
% name_y4 = name_y3 + letter_size;
% name_z4 = name_z3;
% 
% % Generate coordinates for fourth line of C
% name_x5 = name_x4 + letter_size;
% name_y5 = name_y4;
% name_z5 = name_z4;
% 
% % Plot the lines of the letter C
% plot3([name_x1 name_x2],[name_y1 name_y2],[name_z1 name_z2],'k','LineWidth',2);
% hold on;
% plot3([name_x2 name_x3],[name_y2 name_y3],[name_z2 name_z3],'k','LineWidth',2);
% plot3([name_x3 name_x4],[name_y3 name_y4],[name_z3 name_z4],'k','LineWidth',2);
% plot3([name_x4 name_x5],[name_y4 name_y5],[name_z4 name_z5],'k','LineWidth',2);
% 
% % Set axis limits and labels
% axis equal;
% xlabel('X');
% ylabel('Y');
% zlabel('Z');
% xlim([-100 100]);
% ylim([-100 100]);
% zlim([0 200]);
% 
% % Set plot title
% title('Letter C');

% % Define start position
% name_x1 = 0;
% name_y1 = 0;
% name_z1 = 150;
% 
% % Define letter size
% letter_size = 50;
% 
% % Generate coordinates for first line of D
% name_x2 = name_x1;
% name_y2 = name_y1 + letter_size;
% name_z2 = name_z1;
% 
% % Generate coordinates for second line of D
% name_x3 = name_x2 + letter_size;
% name_y3 = name_y2 - letter_size/2;
% name_z3 = name_z2;
% 
% % Generate coordinates for third line of D
% name_x4 = name_x3 - letter_size;
% name_y4 = name_y3 - letter_size/2;
% name_z4 = name_z3;
% 
% 
% 
% % Plot the lines of the letter D
% plot3([name_x1 name_x2],[name_y1 name_y2],[name_z1 name_z2],'k','LineWidth',2);
% hold on;
% plot3([name_x2 name_x3],[name_y2 name_y3],[name_z2 name_z3],'k','LineWidth',2);
% plot3([name_x3 name_x4],[name_y3 name_y4],[name_z3 name_z4],'k','LineWidth',2);
% plot3([name_x4 name_x5],[name_y4 name_y5],[name_z4 name_z5],'k','LineWidth',2);
% 
% % Set axis limits and labels
% axis equal;
% xlabel('X');
% ylabel('Y');
% zlabel('Z');
% xlim([-100 100]);
% ylim([-100 100]);
% zlim([0 200]);
% 
% % Set plot title
% title('Letter D');
% 
% % Define start position
% name_x1 = 0;
% name_y1 = 0;
% name_z1 = 150;
% 
% % Define letter size
% letter_size = 50;
% 
% % Generate coordinates for first line of E
% name_x2 = name_x1 + letter_size;
% name_y2 = name_y1;
% name_z2 = name_z1;
% 
% % Generate coordinates for second line of E
% name_x3 = name_x2 - letter_size;
% name_y3 = name_y2;
% name_z3 = name_z2;
% 
% % Generate coordinates for third line of E
% name_x4 = name_x3;
% name_y4 = name_y3 + letter_size/2;
% name_z4 = name_z3;
% 
% % Generate coordinates for fourth line of E
% name_x5 = name_x4 + letter_size;
% name_y5 = name_y4;
% name_z5 = name_z4;
% 
% % Generate coordinates for fifth line of E
% name_x6 = name_x5 - letter_size;
% name_y6 = name_y5;
% name_z6 = name_z5;
% 
% % Generate coordinates for sixth line of E
% name_x7 = name_x6;
% name_y7 = name_y6 + letter_size/2;
% name_z7 = name_z6;
% 
% % Generate coordinates for seventh line of E
% name_x8 = name_x7 + letter_size;
% name_y8 = name_y7;
% name_z8 = name_z7;
% 
% % Plot the lines of the letter E
% plot3([name_x1 name_x2],[name_y1 name_y2],[name_z1 name_z2],'k','LineWidth',2);
% hold on;
% plot3([name_x2 name_x3],[name_y2 name_y3],[name_z2 name_z3],'k','LineWidth',2);
% plot3([name_x3 name_x4],[name_y3 name_y4],[name_z3 name_z4],'k','LineWidth',2);
% plot3([name_x4 name_x5],[name_y4 name_y5],[name_z4 name_z5],'k','LineWidth',2);
% plot3([name_x5 name_x6],[name_y5 name_y6],[name_z5 name_z6],'k','LineWidth',2);
% plot3([name_x6 name_x7],[name_y6 name_y7],[name_z6 name_z7],'k','LineWidth',2);
% plot3([name_x7 name_x8],[name_y7 name_y8],[name_z7 name_z8],'k','LineWidth',2);
% 
% % Set axis limits and labels
% axis equal;
% xlabel('X');
% ylabel('Y');
% zlabel('Z');
% xlim([-100 100]);
% ylim([-100 100]);
% zlim([0 200]);
% 
% % Set plot title
% title('Letter E');
