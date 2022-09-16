function CR = constrained_CRB(F,R)
%compute the constrained cramer rao lower bound
U=zeros(6,3);
U(:,1)=[R(:,2);-R(:,1);zeros(2,1)];
U(:,2)=[zeros(2,1);zeros(2,1);sqrt(2);0];
U(:,3)=[zeros(2,1);zeros(2,1);0;sqrt(2)];
CR=U*((U'*F*U)\U');
end
