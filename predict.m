%% Ԥ��������
clear
clc
tic; %��ʱ����ʼ
preprocess

%% �õ�ÿ����������ÿ��������Ԥ�� 
[ svmStructs ] = multi( trainX,trainY ); %�������õõ�svmStruct������
predicted = zeros(size(testY)); %�ȶ���յ�Ԥ��
types = unique(testY); %��ȡ����
predictMatrix = zeros(size(testY,1),size(types,1)); %����Ԥ�����
predictMatrix(:,end)=1; %���һ��Ϊ1����Ϊ����ǰ�涼���ǣ��Ǿ������һ��
for i = 1:size(svmStructs,1) %ÿһ������������
    svm_struct  = svmStructs{i};
    Group = svmclassify(svm_struct,testX);
    predictMatrix(:,i) = Group;
end
clear Group i svm_struct;

%% ��ȡ����һ��1���ֵ�λ�ã����Ƿ�������
postion = zeros(size(testY)); 
for i=1:size(predictMatrix,1)
    temp = predictMatrix(i,:);
    one=find(temp==1);
    postion(i,1) = one(1);
end
clear i temp one;

%% ��λ��ת��Ϊ���
predicted = types(postion); 
clear i temp postion;

%%
err = sum(predicted ~= testY);
Accuracy = 1-err/size(testY,1);
Rightrating =strcat(num2str(Accuracy*100),'%');
toc;
fprintf('��ȷ��Ϊ%s\n', Rightrating);



