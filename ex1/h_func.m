function [y_predict] = h_func(K_train, K_traintest, y_train)
%find the y_train label
pos_ind = find(y_train == 1);
neg_ind = find(y_train==-1);
num_pos = length(pos_ind);
num_neg = length(neg_ind);

%size of training and test examples
[num_train,num_test] = size(K_traintest);

% train
ai = zeros(num_train,1);
ai(pos_ind)=1/num_pos;
ai(neg_ind)=-1/num_neg;

b = 1/(2*num_neg^2)*sum(sum(K_train(neg_ind,neg_ind)))-1/(2*num_pos^2) * sum(sum(K_train(pos_ind,pos_ind)));

%predict
y_predict = sign(ai'* K_traintest + repmat(b,1,num_test));
end