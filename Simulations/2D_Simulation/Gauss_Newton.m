function [Re,te] = Gauss_Newton(R0,t0,A,S,d,Sigma)
%Input
%R0(2,2)        : Initial estimate of the rotation matrix
%t0(2,1)        : Initial estimate of the translation vector
%A(2,Mt)        : Anchors' position
%S(2,N)         : Tags' poistion
%d(Mt*N,1)      : distance measurement
%Sigma(1,Mt*N)  : standard deviations


[~,Mt]=size(A);
[~,N]=size(S);
y=zeros(Mt*N,1);
f=zeros(Mt*N,2); %estimated relative position
for i=1:N  %for every sensor i=1,...,N
    f((i-1)*Mt+1:i*Mt,:)=(A-R0*S(:,i)-t0)';
end
f_norm=vecnorm(f,2,2);
y=d-f_norm;
%Calculate design matrix X in the least sqaure probelm y=Xb
Psi=[0;1;-1;0];
J=zeros(Mt*N,3);
Psi_Kron_I2_R_e=Psi'*kron(eye(2),R0');
for i=1:N
    L_i=kron(S(:,i)',eye(2));
    %partial t
    J((i-1)*Mt+1:i*Mt,2:3)=-f((i-1)*Mt+1:i*Mt,:)./f_norm((i-1)*Mt+1:i*Mt);
    %partial x
    J((i-1)*Mt+1:i*Mt,1)=J((i-1)*Mt+1:i*Mt,2:3)*L_i*Psi_Kron_I2_R_e';
end

%P'=J'/diag(Sigma)
P=zeros(Mt*N,3);
for j=1:3
    P(:,j)=J(:,j)./Sigma';
end
estimator=[0;t0]+(P'*J)\P'*y;
te=estimator(2:3);
x=estimator(1);
R_x=[cos(x),-sin(x);sin(x),cos(x)];
Re=R_x*R0;
end

