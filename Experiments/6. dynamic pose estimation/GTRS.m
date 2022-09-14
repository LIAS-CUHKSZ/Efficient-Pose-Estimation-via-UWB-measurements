%定位算法实现，输入为传感器坐标(a为矩阵)和测得的目标到传感器距离距离(r为向量)，输出为目标的坐标，减去噪声的偏置使其变成0均值(第11行)
function [y,t]=GTRS(E1,E2,Rn,D,M,N)
C=eye(2);
%E2: MN*2
Rn_inv=spdiags(1./Rn,0,M*N,M*N); %a sparse diagnoal matrix
EE=E2'*Rn_inv;%2*MN
EEE=(EE*E2)\EE;  %
% % P=eye(M*N)-E2*EEE;
% pD=D-E2*(EEE*D);
% pE1=E1-E2*(EEE*E1);
ppE1=sqrt(Rn_inv)*(E1-E2*(EEE*E1));
ppD=sqrt(Rn_inv)*(D-E2*(EEE*D));
% clear P
AtA_mn=(ppE1'*ppE1)/(M*N);
Atb_mn=(ppE1'*ppD)/(M*N);
% AtA_mn=(pE1'./repmat(Rn,1,2)'*pE1)/(M*N);
% Atb_mn=(pE1'./repmat(Rn,1,2)'*pD)/(M*N);
% cvx_begin sdp quiet;
% variable lambda_l;
% minimize(lambda_l);
% AtA_mn+lambda_l*C>=0;
% cvx_end;
syms lambda real
theta_lambda=(AtA_mn+lambda*C)\Atb_mn;
phi_lambda=theta_lambda'*theta_lambda-1;
[n,~]=numden(phi_lambda);
sol_lambda=real(double(solve(n==0,lambda,'MaxDegree','4')));
sol_lambda=max(sol_lambda);
% if sol_lambda<=lambda_l
%     error('singular case!')
% end
y2=(AtA_mn+sol_lambda*C)\Atb_mn;
y=y2/norm(y2);
t=EEE*(D-E1*y2);
