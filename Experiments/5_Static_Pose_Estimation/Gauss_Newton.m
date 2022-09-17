function [Re,te] = Gauss_Newton(R0,t0,A,S,d,W)
%one-step gauss-newton
%Calculate response y in the least sqaure probelm y=Xb

[~,M]=size(A);%基站数量
[~,N]=size(S);%传感器数量

y=zeros(M*N,1);
f=zeros(M*N,2);  %estimated relative position
for i=1:N  %for every sensor i=1,...,N
    f((i-1)*M+1:i*M,:)=(A-R0*S(:,i)-t0)';
end
f_norm=vecnorm(f,2,2);
y=d-f_norm;
%Calculate design matrix X in the least sqaure probelm y=Xb
Psi=[0;1;-1;0];
J=zeros(M*N,3);
Psi_Kron_I2_R_e=Psi'*kron(eye(2),R0');
for i=1:N
    L_i=kron(S(:,i)',eye(2));
    %partial t
    J((i-1)*M+1:i*M,2:3)=-f((i-1)*M+1:i*M,:)./f_norm((i-1)*M+1:i*M);
    %partial x
    J((i-1)*M+1:i*M,1)=J((i-1)*M+1:i*M,2:3)*L_i*Psi_Kron_I2_R_e';
end

%P'=J'*diag(W)
P=zeros(M*N,3);
for j=1:3
    P(:,j)=J(:,j).*W';
end

estimator=[0;t0]+(P'*J)\P'*y;
%estimator=[0;t0]+(J'*J)\J'*y;
te=estimator(2:3);
x=estimator(1);
R_x=[cos(x),-sin(x);sin(x),cos(x)];
Re=R_x*R0;
end

