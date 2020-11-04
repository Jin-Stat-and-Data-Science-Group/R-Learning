###作业内容###

#1.下载作业3数据集，用for循环读入所有csv文件
setwd('C:/github_repos/R-Learning/Exercises/hw3/data')
dir()
files.list = list()
for (i in dir()){
    files.list[[i]]=read.csv(i)
}
files.list[[1]]

#2.把创建的列表中的realTotalDeath分量转换成一列向量的形式
as.vector(as.matrix(files.list$realTotalDeath.csv)[,-1])

#3.把创建的列表中所有分量转换成一列向量的形式
func = function(x){
    y = as.matrix(x)
    z = as.vector(y[,-1])
    return(z)
}
files.list1 = sapply(files.list,func)
View(files.list1)

#4.创建时间和地区的面板数据的表头
areadata = as.matrix(files.list[[1]])[,1]
timedata = colnames(as.matrix(files.list[[1]]))[-1]
title = expand.grid(timedata,areadata)

#5.把表头和41个列向量合并成一个数据框
results = cbind(title,files.list1)
View(results)

#6.对数据框的变量名进行修改为time, dis和41个csv文件的名字
colnames(results)[1:2] = c('time','dis')

#7.把最后得到的数据框写出为csv文件
write.csv2(results, file = "../results.csv")
