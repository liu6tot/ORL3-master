%��ͨ��PCA��ȡ��ͨ��LDA��ά����ֹSw����
% ��ȷ��100%
clear
clc
load('Yale_32x32.mat');
% ѡȡ���Լ���ÿһ������һ��
testNum = [11,22,33,44,55,66,77,88,99,110,121,132,143,154,165];

%ע�͵��滭��������
%{
%���������Ե�����
testPeople = fea(testNum,:);
for i = 1:size(testNum,2)
    people = reshape(testPeople(i,:),32,32);
    subplot(3,5,i);
    imshow(people/256);
    hold on;
end
%}

trainY = gnd;
trainX = fea;

%PCA ����ȡ
options.PCARatio=0.95;
[eigvector,eigvalue] = PCA(trainX,options);
trainX = trainX*eigvector;
clear eigvector  eigvalue options;

%LDA��ȡ��ά�������
[w] = LDA(trainX,trainY,13);
trainX = trainX*w;
clear w;


%���ѵ�����Ͳ��Լ�
testX = trainX(testNum,:);
testY = trainY(testNum,:);
trainX(testNum,:) = [];
trainY(testNum,:) = [];
clear fea;
clear gnd;