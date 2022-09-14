function [theta] = angular_distance(Re,R)
%ANGULAR_DISTANCE 
%out put the angular distance between estimated and true rotation

R0=R*Re';
theta=acosd(R0(1,1));
end
