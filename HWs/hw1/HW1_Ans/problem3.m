clc;
rng(914163506);
temp=0:10:999;
ID=810199570;
Data = sin(temp)+.2*randn(size(temp));
[i,j]=size(Data);
p=0.80;
idx=randperm(j);
Data_Trainset=Data(:,idx(1:round(p*j)));
Data_Testset=Data(:,idx(round(p*j)+1:end));
Data_Trainset_y=randn(size(Data_Trainset));
Data_Testset_y=randn(size(Data_Testset));
for i=1:size(Data_Trainset)
    Data_Trainset_y(i)=sensor(Data_Trainset(i), ID);
end
for i=1:size(Data_Testset)
    Data_Testset_y(i)=sensor(Data_Testset(i), ID);
end
l1=[];
l2=[];
for i1=1:10
    p=polyfit(Data_Trainset,Data_Trainset_y,i1);
    pval= polyval(p,Data_Trainset_y);
    pvall=polyval(p,Data_Testset_y);
    MSE_Trainset=immse(pval,Data_Trainset);
    MSE_Testset=immse(pvall,Data_Testset);
    g=inv(MSE_Trainset);
    g1=inv(MSE_Testset);
    l1=[l1,g];
    l2=[l2,g1];
    plot(i1,g,'b.-', 'LineWidth', 3);
    legend('Train error','Test error');
    hold on
    plot(i1,g1,'r.-', 'LineWidth', 3);
    legend('Train error','Test error');
    hold on
end
xlabel('Regression', 'FontSize', 15);
ylabel('MSE', 'FontSize', 15);
grid on;
c = polyfit(Data_Trainset,Data_Trainset_y,5);

