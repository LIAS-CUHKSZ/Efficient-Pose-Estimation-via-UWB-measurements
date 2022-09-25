function [y,t,time]=GTRS(E1,E2,Rn,D,Mt,N)
%Input
%E1(Mt*N,2)                 :
%E2(Mt*N,2)                 :
%Rn(Mt*N,1)                 : standard deviations
%D(Mt*N,1)                  :
%Mt
%N                          :
%Output
%y(2,1)                     :
%t(2,1)                     :
%time                       : running time of certain part
time=0;
EE=E2'./repmat(Rn',2,1);%2*MN
EEE=(EE*E2)\EE;  %
ppE1=(E1-E2*(EEE*E1))./repmat(sqrt(Rn),1,2);
ppD=(D-E2*(EEE*D))./sqrt(Rn);
AtA_mn=(ppE1'*ppE1)/(Mt*N);
Atb_mn=(ppE1'*ppD)/(Mt*N);
% cvx_begin sdp quiet;
% variable lambda_l;
% minimize(lambda_l);
% AtA_mn+lambda_l*C>=0;
% cvx_end;
% time=time+toc;
syms lambda real
theta_lambda=(AtA_mn+lambda*eye(2))\Atb_mn;
phi_lambda=theta_lambda'*theta_lambda-1;
[n,~]=numden(phi_lambda);
sol_lambda=real(double(solve(n==0,lambda,'MaxDegree','4')));
sol_lambda=max(sol_lambda);
% if sol_lambda<=lambda_l
%     error('singular case!')
% end
% tic
y2=(AtA_mn+sol_lambda*eye(2))\Atb_mn;
y=y2/norm(y2);
t=EEE*(D-E1*y2);