%%
clc;clear all
%% load the data
load data_all.mat

%%
sigma = [0.01,0.05,0.1,0.5,1,5,10];%different sigma
% create the accuracy
test_acc = zeros(length(sigma),1);
train_acc = zeros(length(sigma),1);
for i = 1:length(sigma)
    K_train = gauss_kernel(X_train, X_train, sigma(i));
    K_traintest = gauss_kernel(X_train, X_test, sigma(i));
    
    %predict accuracy of train data
    y_predict_train = h_func(K_train,K_train,y_train);
    train_acc(i) = sum(y_predict_train == y_train')/length(y_train)*100;
    
    %predict accuracy of the test data
    y_predict_test = h_func(K_train, K_traintest, y_train);
    test_acc(i) = sum(y_predict_test == y_test')/length(y_test)*100; 
end
%% plot
figure(1)
subplot(2,1,1)
semilogx(sigma,test_acc,'red')
title('test data accuracy')
xlabel('sigma')
ylabel('accuracy')
subplot(2,1,2)
semilogx(sigma,train_acc,'black')
xlabel('sigma')
ylabel('accuracy')
title('train data accuracy')


    

