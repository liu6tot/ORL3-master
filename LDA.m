function [w] = LDA(LX,d,nv)
%  LX:������ d:��ǩ�� nv��ǰnv����������

[m,n]=size(LX);
M=mean(LX); %�о�ֵ

Sb=sparse(zeros(n,n)); %n*n��0ϡ�����
Sw=sparse(zeros(n,n));

for i=unique(d') %��ȡ��������ǩ
    Xc=LX(d==i,:); %��ǰ��ǩ�µ�����
    [m1,n1]=size(Xc); 
    mec=mean(Xc); %���ھ�ֵ
    Sw=Sw+(Xc-ones(m1,1)*mec)'*(Xc-ones(m1,1)*mec); %�������ڷ���
    Sb=Sb+m1*(mec-M)'*(mec-M); %�������ڼ䷽��
end

St=Sw+Sb; 
[U,V]=eig(Sb,St);
B=diag(V);
[B,index]=sort(B,'descend');

w=U(:,index(1:nv,1));
% w=orth(w);