function [R_proj,t_e] = estimator(D_bar,HtH_invHt)
%Given sensor and anchor setttings, d_{mi}^2-||a_{m}||^2-\sigma^2
%Output estimate
%Least Square Closed Form
estimate=HtH_invHt*D_bar; %(4,1)
y_e=estimate(1:2);
t_e=estimate(3:4);
R_e=[y_e(2),-y_e(1);y_e(1),y_e(2)];
    
%Projection onto SO(2)
[U,~,V]=svd(R_e);
R_proj=U*diag([1;det(U*V')])*V';
end
