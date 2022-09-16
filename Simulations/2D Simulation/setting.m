function [A,S,Mt] = setting(T,Room_Length,Room_Width,Robot_Size,M,N)
%Input
%T     : repeated ranging numbers
%M     : anchor numbers
%N     : tag numbers
%Output
%Mt    : M*T
%A(2,Mt): stack of all the achors' global coordinate 
%S(2,N): stack of all the tags' local coordinate

%Anchors' coordinates in global frame, required to be non-colinear
A=zeros(2,M);  
if M==3
    A(:,1)=[Room_Length,0];
    A(:,2)=[Room_Length,Room_Width];
    A(:,3)=[0,Room_Width];
else %the position of anchor follows uniform distribution
    A(1,:)=Room_Length*rand([1,M]);
    A(2,:)=Room_Width*rand([1,M]);
end
Mt=M*T;
A=repmat(A,1,T);

%Tags' coorindates in local frame, required to be non-colinear with the
%origin
S=zeros(2,N);
if N==2
    S(:,1)=Robot_Size*[1;0]; 
    S(:,2)=Robot_Size*[1;1]; 
elseif N==3
    S(:,1)=Robot_Size*[1;0]; 
    S(:,2)=Robot_Size*[1;1]; 
    S(:,3)=Robot_Size*[0;1]; 
elseif N==4
    S(:,1)=Robot_Size*[0;0]; 
    S(:,2)=Robot_Size*[1;0];
    S(:,3)=Robot_Size*[1;1]; 
    S(:,4)=Robot_Size*[0;1]; 
end
end

