% Copyright <2022> <Haodong Jiang, Wentao Wang, Yuan Shen, Xinghan Li, Xiaoqiang Ren, Biqiang Mu, Junfeng Wu>
% Haodong Jiang, SLAMLab-CUHKSZ, September 2022
% haodongjiang@link.cuhk.edu.cn, https://github.com/SLAMLab-CUHKSZ 
% paper link: https://arxiv.org/abs/2209.06779

function [R,t] = DAC(P,S)
%Input
%p(N,2)
%s(N,2)
%Output
%R_proj(2,2)            : estimated rotation matrix
%t_e(2,1)               : estimated translation

% A=[s(1,1),-s(2,1),1,0;s(2,1),s(1,1),0,1;s(1,2),-s(2,2),1,0;s(2,2),s(1,2),0,1];
% b=vec(p);
% x=A\b;
% 
% y1=x(1,1)/sqrt(x(1,1)^2+x(2,1)^2);
% y2=x(2,1)/sqrt(x(1,1)^2+x(2,1)^2);
% R=[y1,-y2;y2,y1];
% t=x(3:4,:);

N=size(P,2);
P_bar=mean(P,2);
S_bar=mean(S,2);

Psi=[1,0;0,1;0,-1;1,0];
L_Psi=zeros(2,2,N);
for i=1:N
    L_Psi(:,:,i)=kron(S(:,i)',eye(2))*Psi;
end

%Ax=b
A=zeros(2,2);
for i=1:N
    A=A+2*(L_Psi(:,:,i)*L_Psi(:,:,i)-L_Psi(:,:,i)*kron(S_bar,eye(2))'*Psi);
end
b=zeros(2,1);
for i=1:N
    b=b+2*(L_Psi(:,:,i)*P(:,i)-L_Psi(:,:,i)*P_bar);
end
x=A\b;

y1=x(1,1)/sqrt(x(1,1)^2+x(2,1)^2);
y2=x(2,1)/sqrt(x(1,1)^2+x(2,1)^2);
R=[y1,-y2;y2,y1];
y=[y1;y2];
t=P_bar-kron(S_bar,eye(2))'*Psi*y;
end