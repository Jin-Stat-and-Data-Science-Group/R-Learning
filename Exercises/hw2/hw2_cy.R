
### hw2 ###
#1. 分别创建一个向量、因子、矩阵、时间序列、数据框和列表

a <- c(1,2,3) #向量
b <- factor(1,2,3,levels=1:5) #因子
c <- matrix(1:12,nrow=2) #矩阵
d <- ts(1:12,frequency=12,start=c(1998,1)) #时间序列

A <- 1:4
B <- letters[1:4]
C <- c(TRUE,FALSE,FALSE,FALSE)
D <- c('财大','地大','华师','武大')
data.frame(A,B,C,D) #数据框

e <- list(name="Lily",class="3",grade=96) #列表

#2. 列出当前系统中所有自带数据集，查看faithful数据集内容和帮助

dat = data()
help(faithful)

#3. 把data文件夹中的数据.xls 导入到R中

setwd('D:/study/硕士/研究生学习/R-Learning/Exercises/hw2')#设置当前路径
dat = read.csv('./data/数据.csv', header = T) 

#dat = read.csv('D:/study/硕士/研究生学习/R-Learning/Exercises/hw2/data/数据.csv')
#4. 显示 数据.xls 数据集的结构

str(dat)

#5. 对 数据.xls 数据集 进行子集的提取：
##5.1 删除有缺失值的年份

dat  =  na.omit(dat)

##5.2 提取1978年之后的数据

dat[dat[,1]>=1978,]

##5.3 提取1978年之后且 KR 变量在 1~1.2之间的数据

dat[dat$Year>=1978 & dat$KR>=1 & dat$KR<=1.2,]
    
#6. 把data文件夹中的 GDP.xls 中的4个子表都导入到R中，并把其转换成符合面板数据要求的数据（as.matrix,as.vector，rbind）

install.packages("xlsx")
library(xlsx)
data.list = list()
for (i in 1:4){
    data.list[[i]] = read.xlsx('D:/study/硕士/研究生学习/R-Learning/Exercises/hw2/data/GDP.xls',i,encoding='UTF-8') #确保各子表的年份取值范围为1949-2011年
    }

#数据先处理成矩阵，再处理为向量    
#下列数据操作步骤基本为，先将数据处理为矩阵，删除掉第一列年份，然后再将其转化为向量
gdp1 = as.vector(as.matrix(data.list[[1]])[,-1]) 
gdp2 = as.vector(as.matrix(data.list[[2]])[,-1]) 
gdp3 = as.vector(as.matrix(data.list[[3]][,-34])[,-1]) #第34列为NA,故删除。
gdp4 = as.vector(as.matrix(data.list[[4]])[,-1]) 

year = as.matrix(data.list[[1]])[,1] #提取年份
province = colnames(as.matrix(data.list[[1]])[,-1]) #提取除年份之外的列名，即省份
year_pro = expand.grid(year,province)
panel = cbind(year_pro,gdp1,gdp2,gdp3,gdp4)
colnames(panel) = c('年份','省份','GDP','GDP指数','人均GDP','人均GDP指数')
View(panel) #查看panel

#7. 保存数据

##7.1 写出faithful数据集

write.csv2(faithful,file='D:/study/硕士/研究生学习/R-Learning/Exercises/hw2/data/faithful.csv',row.names = FALSE)

##7.2 写出第5题中最后提取的子集

write.csv2(dat[dat$Year>=1978&dat$KR>=1&dat$KR<=1.2,],file='D:/study/硕士/研究生学习/R-Learning/Exercises/hw2/data/ziji.csv',row.names = FALSE)

##7.3 写出导入 GDP.xls 并整理好之后的数据集

write.csv(panel,file='D:/study/硕士/研究生学习/R-Learning/Exercises/hw2/data/gdp_panel.csv',row.names = FALSE)

