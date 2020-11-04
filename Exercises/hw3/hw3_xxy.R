# 1 作业内容
# 下载作业3数据集，用 for 循环读入所有csv文件

setwd('C:/github_repos/R-Learning/xxy/data')
getwd()
name= list.files(getwd(),pattern ='*.csv')##读取文件名
a=list()
for(i in 1:length(name)){
    a[[i]]=read.csv(name[[i]],header=T)
}

# 把创建的列表中的 realTotalDeath 分量 转换成一列向量的形式

as.vector(as.matrix(a[[36]][,-1]))

# 把创建的列表中所有分量 转换成一列向量的形式
V=list()
for (j in 1:length(name)){
    A=as.matrix(a[[j]][,-1])
    V[[j]]=as.vector(as.list(A))
}


# 创建时间和地区的面板数据的表头
V1=as.vector(rep(a[[1]][,1],10))
V2=as.vector(rep(colnames(a[[1]])[-1],each=18))

# 把表头和41个列向量合并成一个数据框

V=cbind(V1,V2)
for(j in 1:length(name)){
    V3=as.vector(as.list(as.matrix(a[[j]][,-1])))
    V=cbind(V,V3)
}
df = data.frame(matrix(unlist(V), nrow=180, byrow=F))##按列排列


# 对数据框的变量名进行修改为time, dis和 41 个 csv文件的名字

colnames(df)=c('dis','time',name)

# 把最后得到的数据框写出为csv文件
write.csv(df,file='合并数据框.csv')


