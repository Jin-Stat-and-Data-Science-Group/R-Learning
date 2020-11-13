# 1.利用mtcars数据集，使用图形参数的方法作一个包含3行2列的面板图，要求第一列包含
# 4，6，8缸汽车的mpg~wt 的散点图，第二列包含包含4，6，8缸汽车的mpg~hp 的散点图,
# 并对子图形的坐标轴范围、标签、边距等进行设置。
setwd("C:/github_repos/R-Learning/xxy")
pdf(file="6-1.pdf",family="GB1")
dat=data('mtcars')
attach(mtcars)
par(mfrow=c(3,2))
newdata1=mtcars[mtcars$cyl=="4",]
newdata2=mtcars[mtcars$cyl=="6",]
newdata3=mtcars[mtcars$cyl=="8",]
plot(newdata1$wt,newdata1$mpg,xlab='wt',ylab='mpg',main='wt-mpg散点图(cyl=4)',xlim=c(1,3),ylim=c(20,36),)
plot(newdata1$hp,newdata1$mpg,xlab='hp',ylab='mpg',main='hp-mpg散点图(cyl=4)',xlim=c(50,120),ylim=c(20,36))
plot(newdata2$wt,newdata2$mpg,xlab='wt',ylab='mpg',main='wt-mpg散点图(cyl=6)',xlim=c(2.4,3.6),ylim=c(16,22)) 
plot(newdata2$hp,newdata2$mpg,xlab='hp',ylab='mpg',main='hp-mpg散点图(cyl=6)',xlim=c(100,180),ylim=c(16,22)) 
plot(newdata3$wt,newdata3$mpg,xlab='wt',ylab='mpg',main='wt-mpg散点图(cyl=8)',xlim=c(3,5.5),ylim=c(10,20)) 
plot(newdata3$hp,newdata3$mpg,xlab='hp',ylab='mpg',main='hp-mpg散点图(cyl=8)',xlim=c(150,350),ylim=c(10,20)) 
dev.off()
# 2.利用trees 数据集，使用 layout 函数，完成面板图，要求：
# 作 Volume~Girth 的散点图，要求y轴在右边，在图像下方给出Girth的箱线图
# 作 Volume~Height 的散点图，要求y轴在左边，在图像下方给出Height的箱线图
# 在两个散点图中间给出 Volume 的箱线图.
# 对子图形的坐标轴范围、标签、边距等进行设置
pdf(file="6-2.pdf",family="GB1")
data('trees')
attach(trees)
layout(matrix(c(1,2,3,3,4,5),nrow=2))
plot(Girth,Volume,xlab='Girth',ylab='Volume',yaxt='n',xlim=c(8,22),ylim=c(10,80))
axis(side=4)##绘制右侧坐标轴
boxplot(Girth,ylab='Girth',ylim=c(8,22))
boxplot(Volume,ylab='Volumn',ylim=c(10,60))
plot(Height,Volume,xlab='Height',ylab='Volume',,xlim=c(60,90),ylim=c(10,80))
boxplot(Height,ylab='Height',ylim=c(60,90))
dev.off()

# 3.在同一个图形中画出以下函数的曲线：
# y=x^2+2*x+3
# y=x^3+2*x^2+3*x+4
# y=3+2*ln(x)
# y=1+exp(x)
# y=10-3*0.7^x
# y=3*x+4(使用abline)
# y=3(使用abline)
# x=1(使用abline)
# 要求设置为不同的线型和颜色
# 添加曲线的图例(二次曲线，三次曲线，对数曲线等)
# 在图形中添加 两个点， 一条线段，一个矩形，一个说明文字
# 把整个图形的背景设置为黄色
pdf(file="6-3.pdf",family="GB1")
par(bg="yellow",mfrow=c(1,1)) 
x=0:10
y1=x^2+2*x+3
y2=x^3+2*x^2+3*x+4
y3=3+2*log(x)
y4=1+exp(x)
y5=10-3*0.7^x
plot(x,y1,type='l',col='blue',lwd=2,lty=1)
lines(x,y2,type='l',col='black',lwd=2,lty=2)
lines(x,y3,type='o',col='red',lwd=2,lty=3)
lines(x,y4,type='l',col='red',lwd=2,lty=4)
lines(x,y5,type='o',col='black',lwd=2,lty=5)
abline(4,3,col='red',lty=6)
abline(h=3,col="black",lty=7)
abline(v=1,col="blue",lty=8)
points(6,22,pch=10)
points(4,27,pch=13)
rect(5, 50, 7,60) #添加矩形
text(6, 55, '矩形') ##添加文字
text(8, 20, expression(y == 4 + 3*x)) ##添加表达式
legend(6,120,lty=c(1,2,3,4,5,6,7,8),legend=c('二次函数','三次函数','对数函数','指数函数','幂函数','一次函数'))
dev.off()










