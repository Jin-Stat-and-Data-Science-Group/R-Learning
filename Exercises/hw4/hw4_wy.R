###作业内容###

#1.编写一个函数opposite，把向量倒置，对某一向量使用该函数
opposite = function(x){
    rev(as.vector(x))
}
x = 1:10
opposite(x)

#2.编写一个函数shift，把向量元素右移k个位置，对某一向量使用该函数
shift = function(x,k){
    a = x[1:(length(x)-k)]
    b = x[(length(x)-k+1):length(x)]
    c = c(b,a)
    return(c)
}
x = 1:5
shift(x,2)
shift(x,3)

#3.生成一个20行10列的矩阵，把矩阵的每一列倒置，把矩阵的每一行元素向右3个位置
X = matrix(1:200,20,10)
Xcol = ncol(X)
Xrow = nrow(X)
Y = X[Xrow:1,]
for (i in 1:20){
    Y[i,]<-shift(Y[i,],3)
}

#4.编写一个函数fibonacci ，给定一个正整数x, 生成小于x的所有斐波那契数列元素，求x=10000000时具体数列.
fibonacci = function(x){
    a = 1
    b = 1
    n = 1
    while(n<x){
        a = b
        b = a+b
        n = n+1
        if (a<x){print(a)}
    }
}
fibonacci(10000000)

#5.编写一个函数transdata,参数为路径(包括文件名)，读入一个矩形格式的数据并转换为面板数据格式(要求生成好表头)，对第3次作业当中的一个csv文件使用该函数
transdata = function(path){
    data = read.csv(path)
    x = as.matrix(data)
    y = as.vector(as.matrix(data[,-1]))
    a = x[,1]
    b = colnames(x)[-1]
    ab = expand.grid(a,b)
    data1 = cbind(ab,y)
    write.csv(data1, file = "results.csv")
}

transdata('C:/github_repos/R-Learning/Exercises/hw3/data/gdp.csv')