######### 第3次作业 ########
## 作业内容 ##

# 1. 下载作业3数据集，用 for 循环读入所有csv文件

setwd('D:/桌面/R语言学习_jl/作业hw/3/循环数据集')

Lst = list()
for(i in dir()) Lst[[i]] = read.csv(i)   # dir(): 列出指定目录中的文件名称


# 2. 把创建的列表中的 realTotalDeath 分量转换成一列向量的形式

a = as.matrix(Lst$realTotalDeath.csv) # 先转化为矩阵
b = as.vector(a[,-1]) # 再转为列向量


# 3. 把创建的列表中所有分量转换成一列向量的形式

transdata = function(x){
  v = as.vector(as.matrix(x)[,-1])
  return(v)
  }

# sapply()
Lst_v = sapply(Lst, transdata) 


# 4. 创建时间和地区的面板数据的表头

dis = as.character(Lst[[1]][,1])
time = colnames(Lst[[1]][,-1])

# expand.grid() 构造一个数据框，将各参数的各水平完全搭配
dis_time = expand.grid(dis, time)   # 应与列向量数值对应


# 5. 把表头和41个列向量合并成一个数据框

data = cbind(dis_time, Lst_v)
View(data)


# 6. 对数据框的变量名进行修改为time, dis和 41 个 csv文件的名字

colnames(data)[1:2] = c('dis', 'time')
View(data)


# 7. 把最后得到的数据框写出为csv文件

write.csv(data, file = '../data.csv')

