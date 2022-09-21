function [theta] = angular_distance(Re,R)
%Input
%Re(2,2)            : estimated rotation matrix
%R(2,2)             : true rotation matrix
%Output
%theta              : angular distance between estimated and true rotation
R0=R*Re';
theta=acosd(R0(1,1));
end
