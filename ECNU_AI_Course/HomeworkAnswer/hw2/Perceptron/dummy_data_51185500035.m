% 感知机算法—分类

w = [0,0]'; b = 0;  % 初始化w, b
eta = 1;            % 步长
[X, Y] = dummy_data(200);
n1 = find(Y == 1);
n2 = find(Y == -1);
figure, plot(X(n1,1),X(n1,2),'ro')
hold on; plot(X(n2,1),X(n2,2),'bx')
axis([-30 60 -20 80])
select = ceil(rand(1,400000)*200);
for i = select
    if Y(i)*(w'*X(i,:)'+b)<=0
        w = w+eta*Y(i)*X(i,:)';
        b = b+eta*Y(i);
    end    
end
hold on; 
x0 = -30:0.1:60;
plot(x0,(-b-w(1)*x0)/w(2),'g')
xlabel('x_1'); ylabel('x_2');
title('用感知机算法进行分类')

function [X, Y] = dummy_data(n)
% generate a dummy dataset for HW2
%
% Input
%   n: number of data samples
%
% Return
%   X: array of size [n, 2]
%      training data
%   Y: array of size [n, 1]
%      training label, -1 (negative) or 1 (positive)

    n_positive = randi([30, 70], 1)/100;
    n_positive = floor(n*n_positive);
    n_negative = n - n_positive;

    X_positive = sample(n_positive, [20, 60], [40, 80]);
    X_negative = sample(n_negative, [-30, 40], [-20, 70]);
    X = [X_positive; X_negative];

    Y = [ones(n_positive,1); -1*ones(n_negative, 1)];

    idx = randperm(size(Y,1));
    X = X(idx, :);
    Y = Y(idx, :);
end

function rst = sample(num, xrange, yrange)
    X = randi(xrange, num, 1);
    Y = randi(yrange, num, 1);
    rst = [X Y];
end

