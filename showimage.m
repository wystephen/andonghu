clear
clc
close all

%%
load('reflect_dataset.mat');

% Parameters
hz_step = 100;
%time_step = 10:100;
t_step = 50;
num = 24;
len = length(dataset.cal_dataset{num});
first = 1;
tic
%% smooth it
for time_step = 10:100
    for m = 0:0.001:0.01
smooth_dataset = cell(height(dataset),1);
parfor i = 1: length(dataset.timeData)
    smooth_data = [];
    for j = 0: fix(length(dataset.timeData{i})/time_step)-1
        X = [ones(time_step,1),dataset.timeData{i}((time_step*j+1):(time_step*(j+1))),dataset.timeData{i}((time_step*j+1):(time_step*(j+1))).^2];
        y = dataset.exL1Data{i}((time_step*j+1):(time_step*(j+1)));
        theta = pinv(X'*X)*X'*y;
        
        smooth_data = [smooth_data;X*theta];
    end
    smooth_dataset{i} = smooth_data;
end
%load('smooth.mat');

content2 = dataset.exL1Data{num}(1:len)-smooth_dataset{num}(1:len);
%img = ones(floor(size(A,1)/time_step),hz_step);
A = content2;
for i  = 1:t_step:size(A)-t_step
    img( :, floor(i/t_step)+1) = abs(fft(A(i:i+t_step),hz_step));
end
img2 = img;
img2(find(img < m)) = 10;
imagesc(img2);colorbar;
toc
savefig(['Fig/', num2str(time_step),'_', num2str(m),'.Fig'])
    end
end