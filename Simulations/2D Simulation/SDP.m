function [R_hat,t_hat] = SDP(A,S,d1,Rn)
%Input
%A(2,Mt)        : Anchors' position
%S(2,N)         : Tags' position
%d1(Mt*N,1)     :
%Rn(Mt*N,1)     : variance
%Output
%R_hat(2,2)     : estimated rotation matrix 
%t_hat(2,1)     : estimated translation
[~,Mt]=size(A);
[~,N]=size(S);

gamma = [1,0,0,1;0,1,-1,0]';
H1=zeros(Mt*N,7);
for i=1:N
    for m=1:Mt
        H1(m+(i-1)*Mt,:)=[-2*kron(S(:,i)',A(:,m)')*gamma,-2*A(:,m)',2*S(:,i)',1];
    end
end
%P' = H1'*diag(1./Rn)
P=zeros(Mt*N,7);
for j=1:7
    P(:,j) = H1(:,j)./Rn;
end
cvx_begin quiet
    variable F1(7,7) symmetric
    variable f1(7)       
    minimize( trace(P'*H1*F1)-2*trace(d1'./Rn'*H1*f1)+trace(d1'./Rn'*d1))
    subject to
        trace(F1(1:2,1:2)) == 1
        f1(5) == F1(1,3)+F1(2,4)
        f1(6) == F1(1,4)-F1(2,3)
        trace(F1(3:4,3:4)) == trace(F1(5:6,5:6))
        f1(7) == trace(F1(3:4,3:4)) 
        [F1,f1;f1',1] == semidefinite(8)
cvx_end
y_hat=f1(1:2)/norm(f1(1:2));
R_hat = [y_hat(1),-y_hat(2);y_hat(2),y_hat(1)];
t_hat = [f1(3);f1(4)];
end

