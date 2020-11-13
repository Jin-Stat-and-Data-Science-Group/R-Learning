#1. 利用mtcars数据集，使用图形参数的方法作一个包含3行2列的面板图，要求第一列包含4，6，8缸汽车的mpg~wt 的散点图，第二列包含包含4，6，8缸汽车的mpg~hp 的散点图, 并对子图形的坐标轴范围、标签、边距等进行设置。

setwd('D:/study/硕士/研究生学习/R-Learning/Exercises/hw6')#设置当前路径
mtcars= read.csv(file='../hw5/data/mtcars.csv',header=TRUE,dec=".",fill=TRUE)
View(mtcars)
attach(mtcars)

opar = par(no.readonly=TRUE)
pdf('./1mtcars.pdf')
par(mfcol=c(3,2),mar=)
color=c('yellow','green','grey','orange','pink','red','blue','purple')
for (i in c(4,6,8)){
    mtcars_cyl = mtcars[mtcars[,'cyl']==i,]
    xmin = min(mtcars_cyl$wt)
    xmax = max(mtcars_cyl$wt)
    ymin = min(mtcars_cyl$mpg)
    ymax = max(mtcars_cyl$mpg)
    plot(mtcars_cyl$wt,mtcars_cyl$mpg,main=paste0('mpg~wt_cyl=',i),xlim=c(floor(xmin),ceiling(xmax)),ylim=c(floor(ymin),ceiling(ymax)),col=color[i],pch=20)
}
for (i in c(4,6,8)){
    mtcars_cyl = mtcars[mtcars[,'cyl']==i,]
    xmin = min(mtcars_cyl$hp)
    xmax = max(mtcars_cyl$hp)
    ymin = min(mtcars_cyl$mpg)
    ymax = max(mtcars_cyl$mpg)
    plot(mtcars_cyl$hp,mtcars_cyl$mpg,main=paste0('mpg~hp_cyl=',i),xlim=c(floor(xmin),ceiling(xmax)),ylim=c(floor(ymin),ceiling(ymax)),col=color[i],pch=20)
}
dev.off()
#如何对子图的边距进行调整？并添加标签？（感觉不需要添加标签了）


#2. 利用trees 数据集，使用 layout 函数，完成面板图，要求：
#2.1 作 Volume~Girth 的散点图，要求y轴在右边，在图像下方给出Girth的箱线图
#2.2 作 Volume~Height 的散点图，要求y轴在左边，在图像下方给出Height的箱线图
#2.3 在两个散点图中间给出 Volume 的箱线图.
#2.4 对子图形的坐标轴范围、标签、边距等进行设置

attach(trees)
pdf('./2trees.pdf',family='GB1')
layout(matrix(c(1,2,3,0,4,5),nrow=2),widths = c(2,4,2),heights = c(2,4))
#layout.show(5) #显示当前划分
plot(Girth,Volume,pch=20,col='red',yaxt='n')
axis(4,at=c(10,20,30,40,50,60,70,80)) # 1,2,3,4下左上右  at:刻度线和刻度值所在位置
boxplot(Girth,main='Girth')
boxplot(Volume, horizontal=T,main='Volume')
plot(Girth,Volume,pch=20,col='green')
boxplot(Height,main='Height')
dev.off()

#3 在同一个图形中画出以下函数的曲线：
#3.1 y=x^2+2*x+3
#3.2 y=x^3+2*x^2+3*x+4
#3.3 y=3+2*ln(x)
#3.4 y=1+exp(x)
#3.5 y=10-3*0.7^x
#3.6 y=3*x+4(使用abline)
#3.7 y=3(使用abline)
#3.8 x=1(使用abline)
#3.9 要求设置为不同的线型和颜色
#3.10 添加曲线的图例(二次曲线，三次曲线，对数曲线等)
#3.11 在图形中添加 两个点， 一条线段，一个矩形，一个说明文字
#3.12 把整个图形的背景设置为黄色

pdf('./3all_kinds_of_lines.pdf',family='GB1')
par(bg='yellow')
x = sort(runif(1000,-10,10))
x1 = sort(runif(500,0,10))
plot(x,x**2+2*x+3,type='s',col='pink',lwd=2,lty=1)
lines(x,x**3+2*x**2+3*x+4,type='p',col='red',lwd=1,lty=2)
lines(x1,3+2*log(x1),type='l',col='blue',lwd=2,lty=3)
lines(x,1+exp(x),type='b',col='green',lwd=2,lty=4)
lines(x,10-3*0.7**x,type='l',col='black',lwd=1,lty=5)
abline(a=4,b=3,col='orange',lwd=3) #y=3*x+4
abline(h=3,col='grey',lwd=1,lty=2) # y=3
abline(v=1,col='grey',lwd=1,lty=2) # x=1
legend(-10,100,legend = c('二次曲线','三次曲线','对数曲线'),lty=c(1,2,3),col=c('pink','red','blue'))
points(-10,40,pch=8) #添点，下同
points(-5,20,pch=8)
segments(-10,40,-5,20) #添线
rect(-10,40,-5,20) #添加矩形
text(-7.5,45,'矩形')
dev.off()
