# 1.导入GDP数据集，分别作：
setwd('D:/zuel_master/R/R-Learning/Exercises/data')
gdp <- read.csv(file='GDP.csv',header=TRUE,dec='.',fill=TRUE)
pdf(file='hw5_gdp.pdf')

## CPI向量的点图
plot(gdp$CPI)

## 以Kapital为自变量，GDP为因变量，作它们的散点图
plot(gdp$GDP ~ gdp$Kapital,xlab='Kapital',ylab='GDP')

## 作GDP数据集的散点图矩阵
str(gdp)
plot(gdp[,c('Year','GDP','GDPRealRate','Labor','Kapital','KR','Technology','Energy','HR','CPI')],main='GDP数据集',pch=3,col='blue')

## 根据需要设置以上图形的点型，颜色，坐标轴范围，标题等选项
## 保存以上图形
dev.off()


# 2.使用 mtcars 数据集：
pdf(file='hw5_mtcars.pdf')
data(mtcars)
head(mtcars)

## 作 mpg 变量的直方图
hist(mtcars$mpg)

## 对 cyl 变量进行频数分析
table(mtcars$cyl)

## 作 cyl 变量的柱形图和条形图
barplot(table(mtcars$cyl),xlab='cyl',ylab='frequence',main='cyl柱形图')
barplot(table(mtcars$cyl),xlab='cyl',ylab='frequence',horiz=TRUE,main='cyl条形图') # horiz=TRUE绘制水平条形图

## 作 cyl 变量的饼图
pie(table(mtcars$cyl),labels=c('4cyl','6cyl','8cyl'),main='cyl饼图')

## 以 wt 变量作为自变量，以 mpg 变量作为因变量，作它们的散点图
plot(mtcars$mpg ~ mtcars$wt,xlab='wt',ylab='mpg')

## 按 cyl 分类，分别作出三个类别的以 wt 变量作为自变量，以 mpg 变量作为因变量的散点图(分别用子集选取方法和使用by函数作)
### 子集选取
cyl4 <- mtcars[mtcars$cyl=='4',]
cyl6 <- mtcars[mtcars$cyl=='6',]
cyl8 <- mtcars[mtcars$cyl=='8',] 
plot(cyl4$mpg ~ cyl4$wt,xlab='wt',ylab='mpg')
plot(cyl6$mpg ~ cyl6$wt,xlab='wt',ylab='mpg')
plot(cyl8$mpg ~ cyl8$wt,xlab='wt',ylab='mpg')

### by函数


## 按 cyl 分类，作以 wt 变量作为自变量，以 mpg 变量作为因变量的coplot
cyl <- factor(mtcars$cyl,levels=c(4,6,8),labels=c('4cyl','6cyl','8cyl'))
coplot(mtcars$mpg ~ mtcars$wt|cyl,data=mtcars,xlab='wt',ylab='mpg')

## 保存以上图形
dev.off()


# 3.在同一个图形中画出以下函数的曲线：
pdf(file='hw5_plot.pdf')
par(mfrow=c(3,2))
## y=3*x+4
x1 <- -10:10
y1 <- 3*x1+4
plot(x1,y1,lty=1,col='red')
## y=x^2+2*x+3
x2 <- -10:10
y2 <- x2^2+2*x2+3
plot(x2,y2,lty=2,col='blue')
## y=x^3+2*x^2+3*x+4
x3 <- -10:10
y3 <- x3^3+2*x3^2+3*x3+4
plot(x3,y3,lty=3,col='yellow')
## y=3+2*ln(x)
x4 <- 0:20
y4 <- 3+2*log10(x4)
plot(x4,y4,lty=4,col='green')
## y=1+exp(x)
x5 <- -10:10
y5 <- 1+exp(x5)
plot(x5,y5,lty=5,col='purple')
## y=10-3*0.7^x
x6 <- -10:10
y6 <- 10-3*0.7^x6
plot(x6,y6,lty=6,col='brown')
## 要求设置为不同的线型和颜色
## 保存该图形
dev.off()