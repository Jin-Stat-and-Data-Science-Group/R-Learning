#1. 下载作业3数据集，用 for 循环读入所有csv文件

setwd('D:/study/硕士/研究生学习/R-Learning/Exercises/hw3')#设置当前路径
datacsv = dir('./data')

dataList = list()
for (i in 1:length(datacsv)){
    dataList[[i]] = read.csv(paste0('./data/',datacsv[i]))
}
names(dataList) = datacsv #给列表命名，从而可以不用循环就能直接读取realTotalDeath

#2. 把创建的列表中的 realTotalDeath 分量 转换成一列向量的形式

##########################################
### 法一，用到了循环，比较费时间不推荐

for(k in 1:length(datacsv)){
    if (paste0('realTotalDeath','.csv') == datacsv[k]){
        return(k)
    }
}
realTotalDeath = dataList[[k]] #由循环得知k=36
#########################################


### 法二通过对列表命名，可以直接用$来读取数据

realTotalDeath = dataList$realTotalDeath.csv
realTotalDeath.vector = as.vector(as.matrix(realTotalDeath[,-1])) #先转变为矩阵，再按列转变为向量
View(realTotalDeath.vector) 


#3. 把创建的列表中所有分量 转换成一列向量的形式

### 创建函数
translist = function(x){
    result = as.vector(as.matrix(x[,-1]))
    return (result)
}

dataListTrans = sapply(dataList,translist)
View(dataListTrans)

#4. 创建时间和地区的面板数据的表头

time = colnames(realTotalDeath[,-1])#创建时间
dis = as.character(realTotalDeath[,1]) #创建地点，并把它变为字符串

#5. 把表头和41个列向量合并成一个数据框

time_dis = expand.grid(time,dis)
data = cbind(time_dis,dataListTrans)
View(time_dis)

#6. 对数据框的变量名进行修改为time, dis和 41 个 csv文件的名字

colnames(data)[1:2] = c('time','dis')
View(data)

#7. 把最后得到的数据框写出为csv文件

write.csv(data,file='./data_panel.csv',row.names = FALSE)

