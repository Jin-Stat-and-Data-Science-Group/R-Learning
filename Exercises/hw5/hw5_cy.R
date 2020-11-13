#1. 导入GDP数据集，分别作：
##1.1 CPI向量的点图
##1.2 以Kapital为自变量，GDP为因变量，作它们的散点图
##1.3 作GDP数据集的散点图矩阵
##1.4 根据需要设置以上图形的点型，颜色，坐标轴范围，标题等选项
##1.5 保存以上图形


setwd('D:/study/硕士/研究生学习/R-Learning/Exercises/hw5')#设置当前路径
GDPdata = read.csv(file='./data/数据.csv',header=TRUE,dec=".",fill=TRUE)
View(GDPdata)

pdf('./result/T1-1CPI.pdf',width = 4,height = 4)
plot(GDPdata$CPI)  #CPI向量的点图
dev.off() #关掉

pdf('./result/T1-2GDP~Kapital.pdf',width = 4,height = 4)
plot(GDPdata$Kapital,GDPdata$GDP,col='red',pch=20,cex=0.8) #以Kapital为自变量，GDP为因变量，作它们的散点图
dev.off() #关掉

colnames(GDPdata)
pdf('./result/T1-3GDPmatrix.pdf',width = 10,height = 10)
plot(GDPdata[,c("Year","GDP","GDPRealRate","Labor","Kapital","KR","Technology","Energy","HR","CPI")],pch=1,col=c('yellow','blue','green','red'),main='GDP') #作GDP数据集的散点图矩阵
dev.off() #关掉


#2. 使用 mtcars 数据集：
##2.1 作 mpg 变量的直方图
##2.2 对 cyl 变量进行频数分析
##2.3 作 cyl 变量的柱形图和条形图
##2.4 作 cyl 变量的饼图
##2.5 以 wt 变量作为自变量，以 mpg 变量作为因变量，作它们的散点图
##2.6 按 cyl 分类， 分别作出三个类别的以 wt 变量作为自变量，以 mpg 变量作为因变量的散点图(分别用子集选取方法和使用by函数作)
##2.7 按 cyl 分类，作以 wt 变量作为自变量，以 mpg 变量作为因变量的coplot
##2.8 保存以上图形

mtcars= read.csv(file='./data/mtcars.csv',header=TRUE,dec=".",fill=TRUE)
View(mtcars)
attach(mtcars)
pdf('./result/2.pdf')
hist(mpg) #作 mpg 变量的直方图
counts=table(cyl) #频数分析
barplot(counts,xlab='cyl',ylab='Frequency',main='Bar Plot') # 柱状图
barplot(counts,xlab='cyl',ylab='Frequency',main='Bar Plot',horiz=TRUE) #条形图
pie(counts,label=c('4','6','8'),main = 'Pie Chart')#作 cyl 变量的饼图
plot(wt,mpg) #散点图

plot(mtcars[mtcars$cyl==4,]$wt,mtcars[mtcars$cyl==4,]$mpg,xlab='wt',ylab='mpg',main='4 cyl')
plot(mtcars[mtcars$cyl==6,]$wt,mtcars[mtcars$cyl==6,]$mpg,xlab='wt',ylab='mpg',main='6 cyl')
plot(mtcars[mtcars$cyl==8,]$wt,mtcars[mtcars$cyl==8,]$mpg,xlab='wt',ylab='mpg',main='8 cyl')

#使用by函数
by(mtcars$wt,mtcars$cyl,function(x) x)
by(mtcars$mpg,mtcars$cyl,function(x) x)
plot(as.numeric(unlist(by(mtcars$wt,mtcars$cyl,function(x) x)[1])),as.numeric(unlist(by(mtcars$mpg,mtcars$cyl,function(x) x)[1])),xlab='wt',ylab='mpg',main='4 cyl')
plot(as.numeric(unlist(by(mtcars$wt,mtcars$cyl,function(x) x)[2])),as.numeric(unlist(by(mtcars$mpg,mtcars$cyl,function(x) x)[2])),xlab='wt',ylab='mpg',main='4 cyl')
plot(as.numeric(unlist(by(mtcars$wt,mtcars$cyl,function(x) x)[3])),as.numeric(unlist(by(mtcars$mpg,mtcars$cyl,function(x) x)[3])),xlab='wt',ylab='mpg',main='4 cyl')

coplot(mpg~wt|as.factor(cyl),data=mtcars)
dev.off()

#3. 在同一个图形中画出以下函数的曲线：
##3.1 y=3*x+4
##3.2 y=x^2+2*x+3
##3.3 y=x^3+2*x^2+3*x+4
##3.4 y=3+2*ln(x)
##3.5 y=1+exp(x)
##3.6 y=10-3*0.7^x
##3.7 要求设置为不同的线型和颜色
##3.8 保存该图形

pdf('./result/3.pdf',width = 10,height = 10)
x = -100:100
x1 = 0:100
plot(x,3*x+4,type='p',col='red',lwd=0.1)
lines(x,x**2+2*x+3,type='l',col='blue',lwd=2)
lines(x,x**3+2*x**2+3*x+4,type='o',col='black',lwd=0.5)
lines(x1,3+2*log(x1),type='b',col='green',lwd=2)
lines(x,1+exp(x),type='c',col='orange',lwd=2)
lines(x,10-3*0.7**x,type='s',col='pink',lwd=2)
dev.off()