function [pose_turn, x, y, z_hover, gripper] = hover_above_back(pose, x, y, z, gripper)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
z_hover = z + 90;
pose_turn = pose - 90; 

end

