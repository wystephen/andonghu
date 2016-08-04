%提取数据
data_len = 100;
dataset_y=ones(height(dataset),1);
dataset_x=ones(height(dataset),data_len*6);
a=1;
b=1;
k=1;
for i=1:height(dataset)
    
    data_tmp=dataset(i,11);
    data_tmp=data_tmp{1,1}{1,1};
    data_tmp=data_tmp';
    a,b=size(data_tmp);
    if b<data_len
        continue;
    end
    d=dataset(i,3);
    d= d{1,1};
    dataset_y(k) = d(1,1);
    for j=1:6
        
        dataset_x(k,(j-1)*data_len+1:(j*data_len))=data_tmp(j,1:data_len);
    end
    k = k+1;
end


