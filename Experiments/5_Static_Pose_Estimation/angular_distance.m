% Copyright <2022> <Haodong Jiang, Wentao Wang, Yuan Shen, Xinghan Li, Xiaoqiang Ren, Biqiang Mu, Junfeng Wu>
% Haodong Jiang, SLAMLab-CUHKSZ, September 2022
% haodongjiang@link.cuhk.edu.cn, https://github.com/SLAMLab-CUHKSZ 
% paper link: https://arxiv.org/abs/2209.06779

function [theta] = angular_distance(Re,R)
%Input
%Re(2,2)            : estimated rotation matrix
%R(2,2)             : true rotation matrix
%Output
%theta              : angular distance between estimated and true rotation
R0=R*Re';
theta=acosd(R0(1,1));
end
