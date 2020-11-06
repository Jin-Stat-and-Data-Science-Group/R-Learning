# 第4次作业
# 作业内容
# 1.编写一个函数opposite，把向量倒置，对某一向量使用该函数
opposite=function(x){
    rev(x)}
a=c(1,2,3)
opposite(a)

# 2.编写一个函数shift，把向量元素右移 k 个位置，对某一向量使用该函数
shift=function(x,k){
    a=length(x)
    m=x[1:(a-k)]
    n=x[(a-k+1):a]
    c(n,m)
}
x=c(1,2,3,4,5)
shift(x,2)

# 3.生成一个20行10列的矩阵，把矩阵的每一列倒置，把矩阵的每一行元素向右3个位置
mat=matrix(1:200,20,10)
m=ncol(mat)
n=nrow(mat)
b=mat[n:1,]  #把矩阵的每一列倒置
for(i in 1:20) {
    b[i,]=shift(b[i,],3)
    } 
b


# 4.编写一个函数 fibonacci ，给定一个正整数x, 生成小于x的所有斐波那契数列元素，求x=10000000时具体数列.

a=1
b=1 
i=0
fibonacci= function(x){
  while(i<x) {
    c = a+b
    a =b
    b =c
    i = i + 1
    if(a<x){print(a)}
  } 
} 
fibonacci(10000000)

# 5.编写一个函数transdata,参数为路径(包括文件名)，读入一个矩形格式的数据并转换为面板数据格式(要求生成好表头)，对第3次作业当中的一个csv文件使用该函数
setwd("C:/github_repos/R-Learning/xxy/data")
Transdata=function(filename){
Dat=read.csv(filename)
p=as.matrix(Dat)
q=as.vector(as.matrix(Dat[,-1]))
t1=as.character(p[,1])
t2=colnames(p)[-1]
t12=expand.grid(t1,t2)
Dat1=cbind(t12,q)
write.csv(Dat1,file = "新面板数据.csv")
}      
Transdata("realTotalDeath.csv")