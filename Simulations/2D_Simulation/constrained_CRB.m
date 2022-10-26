% Copyright <2022> <Haodong Jiang, Wentao Wang, Yuan Shen, Xinghan Li, Xiaoqiang Ren, Biqiang Mu, Junfeng Wu>
% Haodong Jiang, SLAMLab-CUHKSZ, September 2022
% haodongjiang@link.cuhk.edu.cn, https://github.com/SLAMLab-CUHKSZ 
% paper link: https://arxiv.org/abs/2209.06779

function CR = constrained_CRB(F,R)
%compute the constrained cramer rao lower bound
U=zeros(6,3);
U(:,1)=[R(:,2);-R(:,1);zeros(2,1)];
U(:,2)=[zeros(2,1);zeros(2,1);sqrt(2);0];
U(:,3)=[zeros(2,1);zeros(2,1);0;sqrt(2)];
CR=U*((U'*F*U)\U');
end
