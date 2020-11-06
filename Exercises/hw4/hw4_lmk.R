# 1.编写一个函数opposite，把向量倒置，对某一向量使用该函数
opposite <- function(x){
    rev(as.vector(x))
}
x <- c(1,2,3)
opposite(x)

# 2.编写一个函数shift，把向量元素右移 k 个位置，对某一向量使用该函数
shift <- function(x,k){
    l <- length(x)
    a <- rev(x[1:(l-k)])
    b <- rev(x[(l-k+1):l])
    rev(c(a,b))
}
x <- c(1,2,3,4,5,6,7)
k <- 3
shift(x,k)

# 3.生成一个20行10列的矩阵，把矩阵的每一列倒置，把矩阵的每一行元素向右3个位置
m <- matrix(1:200,20,10)
m <- m[20:1,] # 每一列倒置
for(i in 1:20){
    m[i,] <- shift(m[i,],3)
} # 每一行元素向右3个位置
m

# 4.编写一个函数 fibonacci ，给定一个正整数x，生成小于x的所有斐波那契数列元素，求x=10000000时具体数列
a <- 1
b <- 1
i <- 0
fibonacci <- function(x){
    while(i <= x) {
        c <- a +b
        a <- b
        b <- c
        i <- i + 1
        if (a < x){print(a)
        }
  } 
}
fibonacci(10000000)

# 5.编写一个函数transdata,参数为路径(包括文件名)，读入一个矩形格式的数据并转换为
# 面板数据格式(要求生成好表头)，对第3次作业当中的一个csv文件使用该函数
setwd('D:/zuel_master/R/R-Learning/Exercises/hw3/data')
transdata <- function(filename){
    data <- read.csv(filename)
    x <- as.matrix(data)
    y <- as.vector(as.matrix(data[,-1]))
    a <- as.character(x[,1])
    b <- colnames(x)[-1]
    ab <- expand.grid(a,b)
    data <- cbind(ab,y)
    write.csv(data,file='newdata.csv')
}      
transdata('realTotalDeath.csv')