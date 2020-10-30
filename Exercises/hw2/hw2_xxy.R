# 1、分别创建一个向量、因子、矩阵、时间序列、数据框和列表
a=c(1,2,3)
b=factor(1:3)
d=matrix(1:6,2,3,dimnames = list(nrow=c('r1','r2'),ncol=c('c1','c2','c3')))
##时间序列
ts(1:10,frequency = 4,start=c(2020,1))
ts(1:30,frequency=12,start=c(2020,1))
lst=list(name=c('小红','小花','小明'),age=c(16,18,19),score=c(93,90,95),z=letters[1:3])
lst
df=as.data.frame(lst)
df

# 2、列出当前系统中所有自带数据集，查看faithful数据集内容和帮助
data()
data(faithful)
faithful
help(faithful)
# 3、把data文件夹中的 数据.xls 导入到R中
data=read.csv('xxy/data1/数据.csv',header = T)
##header=T将第一行作为表头行

# 4、显示 数据.xls 数据集的结构
str(data)

# 5、对 数据.xls 数据集 进行子集的提取：
# 删除有缺失值的年份
na.omit(data)
data[complete.cases(data),]  ##提取行子集，列全部包含
# 提取1978年之后的数据
data[data$Year>1978,]
# 提取1978年之后且 KR 变量在 1~1.2之间的数据
da=data[data$Year>1978&data$KR>1&data$KR<1.2,]

# 6、把data文件夹中的 GDP.xls 中的4个子表都导入到R中，并把其转换成符合面板数据要
# 求的数据（as.matrix,as.vector，rbind）
getwd()
install.packages('xlsx')
library('xlsx')
d1=read.xlsx('xxy/data1/GDP.xls',sheetIndex=1,encoding = 'UTF-8')##sheetIndex选择子表
d2=read.xlsx('xxy/data1/GDP.xls',sheetIndex=2,encoding = 'UTF-8')
d3=read.xlsx('xxy/data1/GDP.xls',3,encoding = 'UTF-8')
d4=read.xlsx('xxy/data1/GDP.xls',4,encoding = 'UTF-8')
d11=as.matrix(d1)
d22=as.matrix(d2)
d33=as.matrix(d3[,-34])##将最后一列删除
d44=as.matrix(d4)
sum=rbind(d11,d22,d33,d44)##按行合并

# 7、保存数据
# 写出faithful数据集
write.csv(faithful,file='xxy/faithful.csv')
# 写出第5题中最后提取的子集
write.table(da,file='xxy/子集.txt')
# 写出导入 GDP.xls 并整理好之后的数据集
write.xlsx(d1,'xxy/d1.xls',sheetName='D1',append=T)
write.xlsx(d2,'xxy/d1.xls',sheetName='D2',append=T)
write.xlsx(d3,'xxy/d1.xls',sheetName='D3',append=T)
write.xlsx(d4,'xxy/d1.xls',sheetName='D4',append=T)
write.xlsx(sum,'xxy/sum.xls')