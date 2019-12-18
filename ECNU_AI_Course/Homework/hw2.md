# 作业二

## 机器学习概述及感知机模型

## 内容
一、机器学习 – 极大似然估计

证明：模型是条件概率分布，当损失函数是对数损失函数时，经验风险最小化等价于极大似然估计.

对数损失函数: $L(Y,P(Y|X))=−logP(Y|X)$
二、感知机

（二选一）用感知机模型对以下数据进行分类/拟合并绘制结果：

1. 用感知机模型对`dummy_data`进行分类，打印并绘制结果

2. 用感知机模型对[Boston房价](http://lib.stat.cmu.edu/datasets/boston)数据进行拟合，打印并绘制结果

三、最近邻KNN

你需要利用以下任意一种方式实现K近邻算法并绘制分类边界：

* 朴素KNN，即两两比较
* KD树
* Python 请参考[Python 绘制KNN决策边界](https://scikit-learn.org/stable/auto_examples/neighbors/plot_classification.html#sphx-glr-auto-examples-neighbors-plot-classification-py)

## 参考结果
### 最近邻 KNN
![hw2_knn_result_1](/assets/hw2_knn_result_1.png)