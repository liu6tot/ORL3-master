function [ svmStructs ] = multi( trainX,trainY )
    types = unique(trainY);%���������������
    svmStructs = cell(size(types,1)-1,1);%����ϸ��������
    for i=1:size(types,1)-1
        labels = -ones(size(trainY));%-1,1����
        I = find(trainY==types(i,1));
        labels(I) = 1;
        svmStruct=svmtrain(trainX,labels);%�Դ�svmѵ��
        svmStructs{i} = svmStruct;
    end
end

