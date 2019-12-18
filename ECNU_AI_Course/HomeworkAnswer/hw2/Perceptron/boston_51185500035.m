% 用感知机模型对Boston房价数据进行拟合

w = zeros(13,1); b = 0;  % 选取初值w, b
eta = 1;                 % 步长

[X, Y] = house_price();
mean_price = mean(Y);
Y(Y >= mean_price) = 1;
Y(Y ~= 1) = -1;

num = size(X,2);
for i = ceil(rand(1,1000000)*num)
    if Y(i)*(w'*X(:,i)+b)<=0
        w = w + eta*Y(i)*X(:,i);
        b = b + eta*Y(i);
    end
end

YY = sign(w' * X + b);
wrongpoint = sum(abs(YY-Y),2)/2;   % 输出错分点的个数
fprintf('错分点的个数为：%d',wrongpoint)

flag = {};
for i = 1:num
   if Y(i) == 1
       flag{i} = 'HighPrice Correct';
   else
       flag{i} = 'LowPrice Correct';
   end
end
for i = 1:506
   if (YY(i)-Y(i)) ~= 0
       flag{i} = 'Error';
   end
end
flag = categorical(flag);
gscatter(X(11,:),X(13,:),flag)
xlabel('x_{11}'); ylabel('x_{13}');
title('用感知机模型对Boston房价数据进行拟合')

function [X,Y] = house_price()
% readdata reads boston housing dataset
    dataurl    = 'http://lib.stat.cmu.edu/datasets/boston';
    filename   = 'BostonHousing.txt';

    if ~isfile(filename)
        websave(filename, dataurl);
    end

    assert(isfile(filename), [filename,' not found']);
    try
        fileID = fopen(filename);
        data = parsedata(fileID);
        X = data(:,1:end-1)';
        Y = data(:,end)';
    catch err
        fclose(fileID);
        rethrow(err)
    end
    return

    function data = parsedata(fileID)
        row_offset  = 23; % records start from line 23
        num_records = 506;
        num_columns = 14;

        % pass description(把前面的文字描述部分都pass掉)
        for i = 1: row_offset - 1
            fgetl(fileID);
        end

        data = zeros(num_records,num_columns);
        i = 1;
        while i <= 506
            % each record contains two lines of file
            part1 = fgetl(fileID);
            part2 = fgetl(fileID);
            
            record = textscan([part1,part2],'%f'); % cell（读取包含浮点数的字符向量）
            data(i,:) = record{:};
            i = i + 1;
        end
    end
end
