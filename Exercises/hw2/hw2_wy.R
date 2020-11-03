# 作业内容

# 1. 分别创建一个向量、因子、矩阵、时间序列、数据框和列表
a = vector('numeric',5);a ###向量
b = factor(1:5,levels = 1:5);b ###因子
c = matrix(1:10, nrow = 2, byrow = TRUE);c ###矩阵
d = ts(1:10, frequency = 4, start = c(2010,2));d ### 时间序列

x = 1:4
y = letters[1:4]
e = data.frame(x,y);e ### 数据框

X = 1:3
Y = letters[1:5]
list(X,Y) ### 列表

# 2. 列出当前系统中所有自带数据集，查看faithful数据集内容和帮助
data()
faithful
?faithful

# 3. 把data文件夹中的 数据.xls 导入到R中
shuju = read.csv(file = './数据.csv',header = TRUE)

# 4. 显示 数据.xls 数据集的结构
str(shuju)

# 5. 对 数据.xls 数据集 进行子集的提取：
    ## (1)删除有缺失值的年份
shuju = na.omit(shuju)

    ## (2)提取1978年之后的数据
shuju[shuju[,1]>=1978,]

    ## (3)提取1978年之后且 KR 变量在 1~1.2之间的数据
shuju[shuju$Year>=1978&shuju$KR>=1&shuju$KR<=1.2,]

# 6. 把data文件夹中的 GDP.xls 中的4个子表都导入到R中，并把其转换成符合面板数据要求的数据（as.matrix,as.vector，rbind）
install.packages('xlsx')
library('xlsx')
?read.table
?expand.grid
?as.matrix
?as.vector

for (i in 1:4){
    data.list[[i]]=read.xlsx('./GDP.xls',i,encoding='UTF-8',as.data.frame = TRUE)
}


func = function(x){
    y = as.matrix(x)
    z = as.vector(y[,-1])
    return(z)}  #将数据转化向量,先转矩阵是将数据转化为一种类型，然后再转换为向量

a = data.list[[1]]
a1 = func(a)

b = data.list[[2]]
b1 = func(b)

c = data.list[[3]][,-34]
c1 = func(c)

d = data.list[[4]]
d1 = func(d)    #将数据转化为按列排序的向量

timedata = as.matrix(c)[,1]    #提取第一列时间数据
areadata = colnames(as.matrix(c))[-1]  #提取地区数据
time.area = expand.grid(timedata,areadata)  #构造一个数据框，将时间、地区完全搭配

gdp = cbind(time.area, a1, b1, c1, d1)
colnames(gdp) = c('年份','地区','GDP','GDP指数','人均GDP','人均GDP指数')
View(gdp)

# 7. 保存数据
    ## (1)写出faithful数据集
write.csv2(faithful,file='./faithful.csv')

    ## (2)写出第5题中最后提取的子集
write.csv2(shuju[shuju$Year>=1978&shuju$KR>=1&shuju$KR<=1.2,],file='./subset.csv')

    ## (3)写出导入 GDP.xls 并整理好之后的数据集
write.csv(gdp, file = './gdp_results.csv')
