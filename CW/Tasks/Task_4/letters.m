function [lettersData] = letters(name)
open = 88;
close = 215;


% Define letter size
letter_size = 50;

lettersData = struct('x', [], 'y', [], 'z', [], 'p', [], 'g', [], 'speed', []);

% Define start position
lettersData(end).x = 150;
lettersData(end).y  = 0;
lettersData(end).z = 70;
lettersData(end).p = 180;
lettersData(end).g  = close;
lettersData(end).speed = 20;


% Loop through each letter in the name
for i = 1:length(name)
    % Convert letter to uppercase
    letter = upper(name(i));
    
    % Determine coordinates based on letter shape
    switch letter
        case 'A'
            lettersData(end+1).x = lettersData(end).x + letter_size/2;
            lettersData(end).y  = lettersData(end-1).y + letter_size;
            lettersData(end).z = lettersData(end-1).z;
            lettersData(end).p = lettersData(end-1).p;
            lettersData(end).g  = lettersData(end-1).z;
            lettersData(end).speed = lettersData(end-1).speed;
            
            lettersData(end+1).x = lettersData(end).x + letter_size/2;
            lettersData(end).y = lettersData(end-1).y - letter_size;
            lettersData(end).z = lettersData(end-1).z;
            lettersData(end).p = lettersData(end-1).p;
            lettersData(end).g = lettersData(end-1).z;
            lettersData(end).speed = lettersData(end-1).speed;
            
            lettersData(end+1).x = lettersData(end).x - letter_size/4;
            lettersData(end).y = lettersData(end-1).y - letter_size/2;
            lettersData(end).z = lettersData(end-1).z;
            lettersData(end).p = lettersData(end-1).p;
            lettersData(end).g = lettersData(end-1).z;
            lettersData(end).speed = lettersData(end-1).speed;
            
            lettersData(end+1).x = lettersData(end).x - letter_size/2;
            lettersData(end).y = lettersData(end-1).y;
            lettersData(end).z = lettersData(end-1).z;
            lettersData(end).p = lettersData(end-1).p;
            lettersData(end).g = lettersData(end-1).z;
            lettersData(end).speed = lettersData(end-1).speed;

        case 'B'
            
            lettersData(end+1).x = lettersData(end).x;
            lettersData(end).y = lettersData(end-1).y + letter_size;
            lettersData(end).z = lettersData(end-1).z;
            lettersData(end).p = lettersData(end-1).p;
            lettersData(end).g = lettersData(end-1).z;
            lettersData(end).speed = lettersData(end-1).speed;
            
            lettersData(end+1).x = lettersData(end).x + letter_size/2;
            lettersData(end).y = lettersData(end-1).y - letter_size/4;
            lettersData(end).z = lettersData(end-1).z;
            lettersData(end).p = lettersData(end-1).p;
            lettersData(end).g = lettersData(end-1).z;
            lettersData(end).speed = lettersData(end-1).speed;
            
            lettersData(end+1).x = lettersData(end).x - letter_size/2;
            lettersData(end).y = lettersData(end-1).y - letter_size/4;
            lettersData(end).z = lettersData(end-1).z;
            lettersData(end).p = lettersData(end-1).p;
            lettersData(end).g = lettersData(end-1).z;
            lettersData(end).speed = lettersData(end-1).speed;
            
            lettersData(end+1).x = lettersData(end).x + letter_size/2;
            lettersData(end).y = lettersData(end-1).y - letter_size/4;
            lettersData(end).z = lettersData(end-1).z;
            lettersData(end).p = lettersData(end-1).p;
            lettersData(end).g = lettersData(end-1).z;
            lettersData(end).speed = lettersData(end-1).speed;
            
            lettersData(end+1).x = lettersData(end).x - letter_size/2;
            lettersData(end).y = lettersData(end-1).y - letter_size/4;
            lettersData(end).z = lettersData(end-1).z;
            lettersData(end).p = lettersData(end-1).p;
            lettersData(end).g = lettersData(end-1).z;
            lettersData(end).speed = lettersData(end-1).speed;


        case 'C'
            lettersData(end+1).x = lettersData(end).x + letter_size;
            lettersData(end).y = lettersData(end-1).y;
            lettersData(end).z = lettersData(end-1).z;
            lettersData(end).p = lettersData(end-1).p;
            lettersData(end).g = lettersData(end-1).z;
            lettersData(end).speed = lettersData(end-1).speed;
            
            lettersData(end+1).x = lettersData(end).x - letter_size;
            lettersData(end).y = lettersData(end-1).y;
            lettersData(end).z = lettersData(end-1).z;
            lettersData(end).p = lettersData(end-1).p;
            lettersData(end).g = lettersData(end-1).z;
            lettersData(end).speed = lettersData(end-1).speed;
            
            lettersData(end+1).x = lettersData(end).x;
            lettersData(end).y = lettersData(end-1).y + letter_size;
            lettersData(end).z = lettersData(end-1).z;
            lettersData(end).p = lettersData(end-1).p;
            lettersData(end).g = lettersData(end-1).z;
            lettersData(end).speed = lettersData(end-1).speed;
            
            lettersData(end+1).x = lettersData(end).x + letter_size;
            lettersData(end).y = lettersData(end-1).y;
            lettersData(end).z = lettersData(end-1).z;
            lettersData(end).p = lettersData(end-1).p;
            lettersData(end).g = lettersData(end-1).z;
            lettersData(end).speed = lettersData(end-1).speed;
            
        case 'D'

            % Generate coordinates for first line of D
            lettersData(end+1).x = name_x1;
            lettersData(end).y = name_y1 + letter_size;
            lettersData(end).z = name_z1;
            lettersData(end).p = lettersData(end-1).p;
            lettersData(end).g = lettersData(end-1).z;
            lettersData(end).speed = lettersData(end-1).speed;
            
            % Generate coordinates for second line of D
            lettersData(end+1).x = name_x2 + letter_size;
            lettersData(end).y = name_y2 - letter_size/2;
            lettersData(end).z = name_z2;
            lettersData(end).p = lettersData(end-1).p;
            lettersData(end).g = lettersData(end-1).z;
            lettersData(end).speed = lettersData(end-1).speed;
            
            % Generate coordinates for third line of D
            lettersData(end+1).x = name_x3 - letter_size;
            lettersData(end).y = name_y3 - letter_size/2;
            lettersData(end).z = name_z3;
            lettersData(end).p = lettersData(end-1).p;
            lettersData(end).g = lettersData(end-1).z;
            lettersData(end).speed = lettersData(end-1).speed;
            

        case 'E'
            % Generate coordinates for first line of E
            lettersData(end+1).x = lettersData(end).x + letter_size;
            lettersData(end).y = lettersData(end-1).y;
            lettersData(end).z = lettersData(end-1).z;
            lettersData(end).p = lettersData(end-1).p;
            lettersData(end).g = lettersData(end-1).z;
            lettersData(end).speed = lettersData(end-1).speed;
            
            % Generate coordinates for second line of E
            lettersData(end+1).x = lettersData(end).x - letter_size;
            lettersData(end).y = lettersData(end-1).y;
            lettersData(end).z = lettersData(end-1).z;
            lettersData(end).p = lettersData(end-1).p;
            lettersData(end).g = lettersData(end-1).z;
            lettersData(end).speed = lettersData(end-1).speed;
            
            % Generate coordinates for third line of E
            lettersData(end+1).x = lettersData(end).x;
            lettersData(end).y = lettersData(end-1).y + letter_size/2;
            lettersData(end).z = lettersData(end-1).z;
            lettersData(end).p = lettersData(end-1).p;
            lettersData(end).g = lettersData(end-1).z;
            lettersData(end).speed = lettersData(end-1).speed;
            
            % Generate coordinates for fourth line of E
            lettersData(end+1).x = lettersData(end).x + letter_size;
            lettersData(end).y = lettersData(end-1).y;
            lettersData(end).z = lettersData(end-1).z;
            lettersData(end).p = lettersData(end-1).p;
            lettersData(end).g = lettersData(end-1).z;
            lettersData(end).speed = lettersData(end-1).speed;
            
            % Generate coordinates for fifth line of E
            lettersData(end+1).x = lettersData(end).x - letter_size;
            lettersData(end).y = lettersData(end-1).y;
            lettersData(end).z = lettersData(end-1).z;
            lettersData(end).p = lettersData(end-1).p;
            lettersData(end).g = lettersData(end-1).z;
            lettersData(end).speed = lettersData(end-1).speed;
            
            % Generate coordinates for sixth line of E
            lettersData(end+1).x = lettersData(end).x;
            lettersData(end).y = lettersData(end-1).y + letter_size/2;
            lettersData(end).z = lettersData(end-1).z;
            lettersData(end).p = lettersData(end-1).p;
            lettersData(end).g = lettersData(end-1).z;
            lettersData(end).speed = lettersData(end-1).speed;
            
            % Generate coordinates for seventh line of E
            lettersData(end+1).x = lettersData(end).x + letter_size;
            lettersData(end).y = lettersData(end-1).y;
            lettersData(end).z = lettersData(end-1).z;
            lettersData(end).p = lettersData(end-1).p;
            lettersData(end).g = lettersData(end-1).z;
            lettersData(end).speed = lettersData(end-1).speed;


        otherwise
            warning('Unsupported letter %c', letter);
% % %             DO THE THING WHERE IT MESSES UP THE NAME
    end
    


    % Update start position for next letter
    lettersData(end+1).x = 150;
    lettersData(end).y = lettersData(1).y + i*letter_size + 10;
    lettersData(end).z = 70;
    lettersData(end).p = lettersData(end-1).p;
    lettersData(end).g = lettersData(end-1).z;
    lettersData(end).speed = lettersData(end-1).speed;
end


end

