% Copyright <2022> <Haodong Jiang, Wentao Wang, Yuan Shen, Xinghan Li, Xiaoqiang Ren, Biqiang Mu, Junfeng Wu>
% Haodong Jiang, SLAMLab-CUHKSZ, September 2022
% haodongjiang@link.cuhk.edu.cn, https://github.com/SLAMLab-CUHKSZ 
% paper link: https://arxiv.org/abs/2209.06779

function [R_proj,t_e] = ULS(D_bar,HtH_invHt)
%Input
%D_bar(Mt*N,1)          : d_{im}^2-||a_{m}||^2-\sigma_{im}^2
%HtH_invHt(4,Mt*N)      : (H'*H)^{-1}*H'
%Output
%R_proj(2,2)            : estimated rotation matrix
%t_e(2,1)               : estimated translation
%Least Square Closed Form
estimate=HtH_invHt*D_bar; 
y_e=estimate(1:2);
t_e=estimate(3:4);
R_e=[y_e(2),-y_e(1);y_e(1),y_e(2)];
    
%Projection onto SO(2)
[U,~,V]=svd(R_e);
R_proj=U*diag([1;det(U*V')])*V';
end
