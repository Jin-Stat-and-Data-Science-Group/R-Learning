###作业内容###

setwd('C:/github_repos/R-Learning/Exercises/hw6')
#1.利用mtcars数据集，使用图形参数的方法作一个包含3行2列的面板图，要求第一列包含4，6，8缸汽车的mpg~wt 的散点图，第二列包含包含4，6，8缸汽车的mpg~hp 的散点图，并对子图形的坐标轴范围、标签、边距等进行设置。
mtdata = mtcars
par(mfrow=c(3,2))
cyl1 = factor(mtdata$cyl,levels = c(4,6,8),labels = c('4 cyl','6 cyl','8 cyl'))
cyl.4=mtdata[mtdata$cyl=='4',]
cyl.6=mtdata[mtdata$cyl=='6',]
cyl.8=mtdata[mtdata$cyl=='8',]
plot(cyl.4$wt,cyl.4$mpg,xlab="wt",ylab='mpg',main='4 cyl:wt')
plot(cyl.4$hp,cyl.4$mpg,xlab="hp",ylab='mpg',main='4 cyl:hp')
plot(cyl.6$wt,cyl.6$mpg,xlab="wt",ylab='mpg',main='6 cyl:wt')
plot(cyl.6$hp,cyl.6$mpg,xlab="hp",ylab='mpg',main='6 cyl:hp')
plot(cyl.8$wt,cyl.8$mpg,xlab="wt",ylab='mpg',main='8 cyl:wt')
plot(cyl.8$hp,cyl.8$mpg,xlab="hp",ylab='mpg',main='8 cyl:hp')

#2.利用trees数据集，使用layout函数，完成面板图，要求：
    #(1)作 Volume~Girth 的散点图，要求y轴在右边，在图像下方给出Girth的箱线图
    #(2)作 Volume~Height 的散点图，要求y轴在左边，在图像下方给出Height的箱线图
    #(3)在两个散点图中间给出 Volume 的箱线图.
    #(4)对子图形的坐标轴范围、标签、边距等进行设置
layout(matrix(c(1,2,3,3,4,5),nrow=2),heights = c(2,1))
layout.show(5)
trees
plot(trees$Girth,trees$Volume,yaxt='n',xlab='Girth',ylab='Volume',main='Volume~Girth')
axis(4,at=trees$Volume,labels=trees$Volume)
boxplot(trees$Girth,horizontal=TRUE,main='boxplot of Girth')
boxplot(trees$Volume,main='boxplot of Volume')
plot(trees$Height,trees$Volume,yaxt='n',xlab='Height',ylab='Volume',main='Volume~Height')
axis(2,at=trees$Volume,labels=trees$Volume)
boxplot(trees$Height,horizontal=TRUE,main='boxplot of Height')

#3.在同一个图形中画出以下函数的曲线：
    #(1)y=x^2+2*x+3
    #(2)y=x^3+2*x^2+3*x+4
    #(3)y=3+2*ln(x)
    #(4)y=1+exp(x)
    #(5)y=10-3*0.7^x
    #(6)y=3*x+4(使用abline)
    #(7)y=3(使用abline)
    #(8)x=1(使用abline)
    #(9)要求设置为不同的线型和颜色
    #(10)添加曲线的图例(二次曲线，三次曲线，对数曲线等)
    #(11)在图形中添加 两个点， 一条线段，一个矩形，一个说明文字
    #(12)把整个图形的背景设置为黄色
par1=par(no.readonly = T)
par(mfrow=c(1,1),bg='yellow')
x=0:10
y1=x^2+2*x+3
y2=x^3+2*x^2+3*x+4
y3=3+2*log(x)
y4=1+exp(x)
y5=10-3*0.7^x
plot(x,y1,col='red',type='l',pch=15)
lines(x,y2,type='b',col='blue',pch=16)
lines(x,y3,type='o',col='green',pch=17)
lines(x,y4,col='grey',pch=18)
lines(x,y5,type='b',col='brown',pch=19)
abline(a = 4, b = 3,col='purple')
abline(h = 3, col='black')
abline(v = 1, col='pink')
legend("topright", inset=.05, title="Line Type", c("二次曲线","三次曲线","对数曲线","以e为底指数曲线","指数曲线","一次曲线","水平线","垂直线"),col=c("red", "blue","green","grey","brown","purple","black","pink"),pch = 16)
points(2,60)
points(5,80)
segments(2,100,5,120)
rect(8,40,10,60)
text(9,50,labels='矩形')
par(par1)