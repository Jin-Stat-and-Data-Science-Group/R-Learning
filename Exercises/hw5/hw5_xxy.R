# 1.导入GDP数据集，分别作：
# CPI向量的点图
# 以Kapital为自变量，GDP为因变量，作它们的散点图
# 作GDP数据集的散点图矩阵
# 根据需要设置以上图形的点型，颜色，坐标轴范围，标题等选项
# 保存以上图形
getwd()
setwd('C:/github_repos/R-Learning/xxy')
pdf(file="5-1.pdf",family="GB1")
GDPdata=read.csv('C:/github_repos/R-Learning/xxy/data1/GDP.csv',header = T)
str(GDPdata)
plot(GDPdata['CPI'],col="blue",xlim=c(0.9,1.3),xlab='CPI',main='CPI点图')
# plot(GDPdata$Kapital,GDPdata$GDP,xlab='Kapital',ylab='GDP')
plot(GDPdata[,c("Kapital","GDP")],col="red",xlim=c(0,200000),ylim=c(600,410000),xlab='Kapital',ylab='GDP',main='Kapital-GDP散点图')
plot(GDPdata[,c("Year","GDP","GDPRealRate","Labor","Kapital","KR","Technology","Energy","HR","CPI")],pch=1,col=c('yellow','green','black','red','blue'),main="GDP数据集")
dev.off()

# 2.使用 mtcars 数据集：
# 作 mpg 变量的直方图
# 对 cyl 变量进行频数分析
# 作 cyl 变量的柱形图和条形图
# 作 cyl 变量的饼图
# 以 wt 变量作为自变量，以 mpg 变量作为因变量，作它们的散点图
# 按 cyl 分类， 分别作出三个类别的以 wt 变量作为自变量，以 mpg 变量作为因变量的散点图(分别用子集选取方法和使用by函数作)
# 按 cyl 分类，作以 wt 变量作为自变量，以 mpg 变量作为因变量的coplot
# 保存以上图形
pdf(file="5-2.pdf",family="GB1")
str(mtcars)
attach(mtcars)
hist(mpg)
hist(cyl)
counts=table(cyl)
barplot(counts,xlab="cyl",ylab="Frequency",main="柱形图")
barplot(counts,xlab="cyl",ylab="Frequency",main="条形图",horiz=TRUE) 
pie(counts,labels=c("4","6","8"),main="饼图")     
plot(wt,mpg,main='wt-mpg散点图')
##by函数
b1=by(wt,cyl,function(x) x)
b2=by(mpg,cyl,function(x) x)
plot(as.numeric(unlist(b1[1])),as.numeric(unlist(b2[1])),xlab="wt",ylab='mpg',main='4 cyl')
plot(as.numeric(unlist(b1[2])),as.numeric(unlist(b2[2])),xlab="wt",ylab='mpg',main='6 cyl')
plot(as.numeric(unlist(b1[3])),as.numeric(unlist(b2[3])),xlab="wt",ylab='mpg',main='8 cyl')
##子集选取
newdata1=mtcars[mtcars$cyl=="4",]
newdata2=mtcars[mtcars$cyl=="6",]
newdata3=mtcars[mtcars$cyl=="8",]
split.screen(c(1,3))
plot(newdata1$wt,newdata1$mpg,xlab='wt',ylab='mpg',main='wt-mpg散点图(cyl=4)')
screen(2)   
plot(newdata2$wt,newdata2$mpg,xlab='wt',ylab='mpg',main='wt-mpg散点图(cyl=6)')
screen(3)   
plot(newdata3$wt,newdata3$mpg,xlab='wt',ylab='mpg',main='wt-mpg散点图(cyl=8)') 
cyl1=factor(cyl,levels=c(4,6,8),labels=c("4 cylinder","6 cylinder","8 cylinder"))
coplot(mpg~wt|cyl1,data=mtcars)
dev.off()
# 3.在同一个图形中画出以下函数的曲线：
# y=3*x+4
# y=x^2+2*x+3
# y=x^3+2*x^2+3*x+4
# y=3+2*ln(x)
# y=1+exp(x)
# y=10-3*0.7^x
# 要求设置为不同的线型和颜色
# 保存该图形
pdf(file="5-3.pdf",family="GB1")
par(mfrow=c(1,1))
x=-20:20
y1=3*x+4
y2=x^2+2*x+3
y3=x^3+2*x^2+3*x+4
y4=3+2*log(x)
y5=1+exp(x)
y6=10-3*0.7^x
plot(x,y1,type='p',col='blue',lwd=2)
lines(x,y2,type='l',col='yellow',lwd=2)
lines(x,y3,type='b',col='red',lwd=2)
lines(x,y4,type='o',col='grey',lwd=2)
lines(x,y5,type='p',col='black',lwd=2)
lines(x,y6,type='l',col='pink',lwd=2)
dev.off()





