# 1.分别创建一个向量、因子、矩阵、时间序列、数据框和列表
a <- c(1,2,3) # 向量
b <- factor(1:3,labels=c('A','B','C')) # 因子
matrix(1:12,nrow=3) # 矩阵，默认按列排，byrow=T为按行
ts(1:10,frequency=4,start=c(1998,2)) # 时间序列，c(1998,2)为从1998年开始，第一行留2-1=1个空

c <- 1:4 # 数据框
d <- letters[1:4]
e <- c(TRUE,FALSE,FALSE,FALSE)
f <- c('财大','武大','华科','华师')
data.frame(c,d,e,f)

Lst <- list(name='lmk',school='zuel',studentid=202012190132) # 列表
Lst$name
Lst$school
Lst$studentid

# 2.列出当前系统中所有自带数据集，查看faithful数据集内容和帮助
data() # 列出已载入的包中的所有数据集合
data(package = .packages(all.available = TRUE)) # 列出已安装的包中的所有数据集
?faithful

# 3.把data文件夹中的 数据.xls 导入到R中
library(xlsx)
data <- read.xlsx('D:/zuel_master/R/R-Learning/Exercises/data/数据.xls',1) # 1: sheetindex

# 4.显示 数据.xls 数据集的结构
str(data)

# 5.对 数据.xls 数据集 进行子集的提取：
##  1.删除有缺失值的年份
data <- na.omit(data)

##  2.提取1978年之后的数据
data[data[,1]>=1978,]

##  3.提取1978年之后且 KR 变量在 1~1.2之间的数据
data3 <- data[data$Year>=1978 & data$KR>=1 & data$KR<=1.2,]

# 6.把data文件夹中的 GDP.xls 中的4个子表都导入到R中，并把其转换成符合面板数据要求的数据（as.matrix,as.vector,rbind,expand.grid()
data.list <- list()
for (i in 1:4){
    data.list[[i]]=read.xlsx('D:/zuel_master/R/R-Learning/Exercises/data/GDP.xls',i,encoding='UTF-8')
}
a1 <- as.matrix(data.list[[1]])
a2 <- as.vector(a1[,-1])
b1 <- as.matrix(data.list[[2]])
b2 <- as.vector(b1[,-1])
c1 <- as.matrix(data.list[[3]][,-34]) # 第34列为多余的缺失值列
c2 <- as.vector(c1[,-1])
d1 <- as.matrix(data.list[[4]])
d2 <- as.vector(d1[,-1])

year <- a1[,1] # 年份列
dist <- colnames(a1[,-1]) # 地区列
rowindex <- expand.grid(year,dist) # 构造年份+地区的行索引 
gdp <- cbind(rowindex,a2,b2,c2,d2) # 需保证行数相同，年份为1949-2011
colnames(gdp) <- c('年份','地区','GDP','GDP指数','人均GDP','人均GDP指数') # 增加列名
View(gdp)

# 7.保存数据
##  1.写出faithful数据集
data(faithful)
write.csv(faithful,'D:/zuel_master/R/R-Learning/Exercises/hw2/faithful.csv')

##  2.写出第5题中最后提取的子集
write.csv(data3,'D:/zuel_master/R/R-Learning/Exercises/hw2/data.csv')

##  3.写出导入 GDP.xls 并整理好之后的数据集
write.csv(gdp,'D:/zuel_master/R/R-Learning/Exercises/hw2/gdp.csv')