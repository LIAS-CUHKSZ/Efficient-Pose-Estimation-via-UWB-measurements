function [R_sdr,t_sdr] = SDP(A,S,d1,diagonal)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
[~,M]=size(A);%基站数量
[~,N]=size(S);%传感器数量

gamma = [1,0,0,1;0,1,-1,0]';
H1=zeros(M*N,7);
% cov_square_inv_d1=zeros(M*N,1);
% cov_square_inv_H1=zeros(M*N,7);
% %covariance=sparse(4*diag((d.*Sigma').^2));
% %The computation covariance\(H1*F1*H1'-2*H1*f1*d1'+d1*d1') is too high
% %Instead, we calculate covariance^{-1/2}*H1 and covariance^{-1/2}

for i=1:N
    for m=1:M
        H1(m+(i-1)*M,:)=[-2*kron(S(:,i)',A(:,m)')*gamma,-2*A(:,m)',2*S(:,i)',1];
    end
end
%H1(M*N,7)

% y = R(:,1);%(2,1)
% f1 = [y',t',(kron(eye(2),t')*gamma*y)',norm(t)^2]';%(7,1)
% F1 = f1*f1';%(7,7)
% F = [F1,f1;f1',1];

%P' = H1'*diag(diagonal)
P=zeros(M*N,7);
for j=1:7
    P(:,j) = H1(:,j).*diagonal;
end

cvx_begin quiet
    variable F1(7,7) symmetric
    variable f1(7)       
    minimize( trace(P'*H1*F1)-2*trace(d1'.*diagonal'*H1*f1)+trace(d1'.*diagonal'*d1))
    subject to
        trace(F1(1:2,1:2)) == 1
        f1(5) == F1(1,3)+F1(2,4)
        f1(6) == F1(1,4)-F1(2,3)
        trace(F1(3:4,3:4)) == trace(F1(5:6,5:6))
        f1(7) == trace(F1(3:4,3:4)) 
        [F1,f1;f1',1] == semidefinite(8)
cvx_end

y_hat=f1(1:2)/norm(f1(1:2));
R_sdr = [y_hat(1),-y_hat(2);y_hat(2),y_hat(1)];
t_sdr = [f1(3);f1(4)];
end

