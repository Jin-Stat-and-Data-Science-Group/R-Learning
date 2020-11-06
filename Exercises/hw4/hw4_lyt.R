######## 第4次作业 ########
### 作业内容

# 1. 编写一个函数opposite，把向量倒置，对某一向量使用该函数

opposite = function(x){
    rev(as.vector(x))
    }
a = opposite(c(1,2,3)); a


# 2. 编写一个函数shift，把向量元素右移 k 个位置，对某一向量使用该函数

shift = function(x, k){
    l = length(x)
    x1 = rev(x[1:(l - k)])
    x2 = rev(x[(l - k + 1):l])
    rev(c(x1, x2))
    }

shift(c(1,2,3,4,5,6),2)


# 3. 生成一个20行10列的矩阵，把矩阵的每一列倒置，把矩阵的每一行元素向右3个位置

mat = matrix(1:200,20,10)
m = ncol(mat)
n = nrow(mat)
b = mat[n:1,]  #把矩阵的每一列倒置
for(i in 1:20) {b[i,] = shift(b[i,],3)} 
b


# 4. 编写一个函数 fibonacci ，给定一个正整数x, 生成小于x的所有斐波那契数列元素，求x=10000000时具体数列.

fibonacci<- function(x){
    u = 1; v = 1; i = 0; print(u)
    while(i < x) {
        w = u +v
        u =v
        v =w
        i = i + 1
        if(u < x){print(u)}
    } 
} 

fibonacci(10000000)


# 5. 编写一个函数transdata,参数为路径(包括文件名)，读入一个矩形格式的数据并转换为面板数据格式(要求生成好表头)，对第3次作业当中的一个csv文件使用该函数

transdata = function(filename){
    data = read.csv(filename)
    m = as.matrix(data)
    v = as.vector(as.matrix(data[,-1]))
    x1 = as.character(m[,1])
    x2 = colnames(m)[-1]
    x1_x2 = expand.grid(x1, x2)
    data_combine = cbind(x1_x2, v)
    View(data_combine)
}    

setwd("D:/桌面/R语言学习_jl/作业hw/3/循环数据集")
transdata("realTotalDeath.csv")

