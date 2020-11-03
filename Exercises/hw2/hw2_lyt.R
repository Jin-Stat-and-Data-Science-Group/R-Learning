########## 第2次作业 ###########

# 1. 分别创建一个向量、因子、矩阵、时间序列、数据框和列表

a = vector('numeric', 10) ;a          #向量

b = factor(1:3, labels = c('A','B','C')) ;b    #因子

c =  matrix(1:12, nrow = 2) ;c        #矩阵

d = ts(1:10, frequency = 4, start = c(1959, 2)) ;d   #时间序列

e = data.frame(a = 1:4,
               b = letters[1:4],
               c = c(TRUE, FALSE, FALSE, FALSE),
               f = c('武大','华科','财大','华师')) ;e    #数据框

f = list(name = 'Fred', wife = 'Mary', no.children = 3, child.ages = c(4,7,9)) ;f   #列表



# 2. 列出当前系统中所有自带数据集，查看faithful数据集内容和帮助

data()       # 已载入包的数据集
str(faithful)       
help(faithful)



# 3. 把data文件夹中的 数据.xls 导入到R中

setwd('D:/桌面/R语言学习_jl/作业hw')
data = read.csv('./data/数据.csv', header = T)   # header参数表示是否将csv文件的第一行作为列名
head(data)



# 4. 显示 数据.xls 数据集的结构

str(data)      # 显示数据的结构：使用str函数



# 5. 对 数据.xls 数据集进行子集的提取：
    # 1. 删除有缺失值的年份
    # 2. 提取1978年之后的数据
    # 3. 提取1978年之后且 KR 变量在 1~1.2之间的数据

data1 = na.omit(data)       # na.omit(): 移除所有含有缺失数据的行
data2 = data[data[,1]>1978,]
data3 = data[(data[,1]>1978)&(data[,6]>1)&(data[,6]<1.2),]



# 6. 把data文件夹中的 GDP.xls 中的4个子表都导入到R中，并把其转换成符合面板数据要求的数据（as.matrix,as.vector，rbind）

install.packages("xlsx")
library(xlsx)
  
data_list = list()
for(i in 1:4){
    data_list[[i]] = read.xlsx('./data/GDP.xls', i, encoding = 'UTF-8')}     # 保证每一个sheet的年份取值均为1949-2011年, 需补充缺失行

# 数据先转换为矩阵，再转化为向量
m1 = as.matrix(data_list[[1]])   
v1 = as.vector(m1[,-1])    # 删除第一列(年份),将数据转化为按列排序的向量
m2 = as.matrix(data_list[[2]])   
v2 = as.vector(m2[,-1])    
m3 = as.matrix(data_list[[3]][,-34])   # 最后一列均为NA，删去   
v3 = as.vector(m3[,-1])    
m4 = as.matrix(data_list[[4]])   
v4 = as.vector(m4[,-1])    

year = m1[,1]     # 提取年份取值
province = colnames(m1[,-1])  # 提取除年份外的列名(省份)
year_province = expand.grid(year, province)

combine = cbind(year_province, v1, v2, v3, v4)
colnames(combine)<-c("年份","省份","GDP","GDP指数","人均GDP","人均GDP指数")
View(combine)



# 7. 保存数据
    # 1. 写出faithful数据集
    # 2. 写出第5题中最后提取的子集
    # 3. 写出导入 GDP.xls 并整理好之后的数据集

write.csv(faithful, file = "./faithful.csv", row.names = FALSE)   # 不保留表格列序行号
write.csv(data3, file = './data3.csv', row.names = FALSE)
write.csv(gdp, file = './面板数据.csv', row.names = FALSE)
write.csv(combine, file = './gdp_combine.csv', row.names = FALSE)



