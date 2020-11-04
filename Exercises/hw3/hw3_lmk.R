# 1.下载作业3数据集，用 for 循环读入所有csv文件
setwd('D:/zuel_master/R/R-Learning/Exercises/hw3/data')
dir()
data.list <- list()
for (i in dir()){
    data.list[[i]]=read.csv(i)
}

# 2.把创建的列表中的 realTotalDeath 分量 转换成一列向量的形式
as.vector(as.matrix(data.list[[36]])[,-1]) # 删除第一列地区

# 3.把创建的列表中所有分量 转换成一列向量的形式
fun <- function(x){
    y <- as.vector(as.matrix(x)[,-1])
    return(y)
}
Lst <- sapply(data.list,fun)

# 4.创建时间和地区的面板数据的表头
year <- colnames(as.matrix(data.list[[1]]))[-1] # 删除'district'
dist <- as.matrix(data.list[[1]])[,1]
rowindex <- expand.grid(year,dist)

# 5.把表头和41个列向量合并成一个数据框
df <- cbind(rowindex,Lst)
View(df)

# 6.对数据框的变量名进行修改为time, dis和 41 个 csv文件的名字
colnames(df)[1:2] <- c('time','dis')
View(df)

# 7.把最后得到的数据框写出为csv文件
write.csv(df,file='../dataframe.csv',row.names=FALSE)