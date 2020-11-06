#1. 编写一个函数opposite，把向量倒置，对某一向量使用该函数

opposite = function(x){
    rev(as.vector(x))
}
opposite(c(1,2,3))

#2. 编写一个函数shift，把向量元素右移 k 个位置，对某一向量使用该函数

shift = function(x,k){
    len = length(x)
    x1 = x[1:(len-k)]
    x2 = x[(len-k+1):len]
    return (c(x2,x1))
}
shift(c(1,2,3,4,5),5)

#3. 生成一个20行10列的矩阵，把矩阵的每一列倒置，把矩阵的每一行元素向右3个位置

A = matrix(1:200,nrow=20,ncol=10);
AT = A[nrow(A):1,]; #把矩阵的每一列进行转置
for(i in 1:20) {
    AT[i,] = shift(AT[i,],3)
    } 
View(AT)

#4. 编写一个函数 fibonacci ，给定一个正整数x, 生成小于x的所有斐波那契数列元素， 求x=10000000时具体数列.



a=1;b=1;i=0
fibonacci <- function(x){
    while(i <= x) {
        if (a<x){print(a)
            c = a +b
            a =b
            b =c
            i = i + 1
        }
  } 
}

fibonacci(20)

#5. 编写一个函数transdata,参数为路径(包括文件名)，读入一个矩形格式的数据并转换为面板数据格式(要求生成好表头)，对第3次作业当中的一个csv文件使用该函数

setwd('D:/study/硕士/研究生学习/R-Learning/Exercises')#设置当前路径
Transdata = function(filename){
    data = read.csv(filename)
    A = as.matrix(data)
    a = as.vector(as.matrix(data[,-1]))
    dis = as.character(A[,1])
    time = colnames(A)[-1]
    dis_time = expand.grid(dis,time)
    data1 = cbind(dis_time,a)
    write.csv(data1,file = "./hw4/realTotalDeath_trans.csv")
}      
Transdata('./hw3/data/realTotalDeath.csv')

