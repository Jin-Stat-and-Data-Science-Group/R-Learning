# 1.利用mtcars数据集，使用图形参数的方法作一个包含3行2列的面板图，要求第一列包含
# 4，6，8缸汽车的mpg~wt 的散点图，第二列包含包含4，6，8缸汽车的mpg~hp 的散点图,
# 并对子图形的坐标轴范围、标签、边距等进行设置。
data(mtcars)
cyl <- factor(mtcars$cyl,levels=c(4,6,8),labels=c('4cyl','6cyl','8cyl'))
par(mfrow=c(3,2))
cyl4 <- mtcars[mtcars$cyl=='4',]
cyl6 <- mtcars[mtcars$cyl=='6',]
cyl8 <- mtcars[mtcars$cyl=='8',] 
plot(cyl4$mpg ~ cyl4$wt,xlab='wt',ylab='mpg',main='cyl4',xlim=c(1.5,3.5))
plot(cyl4$mpg ~ cyl4$hp,xlab='hp',ylab='mpg',main='cyl4')
plot(cyl6$mpg ~ cyl6$wt,xlab='wt',ylab='mpg',main='cyl6',xlim=c(2.5,3.5))
plot(cyl6$mpg ~ cyl6$hp,xlab='hp',ylab='mpg',main='cyl6',xlim=c(100,180))
plot(cyl8$mpg ~ cyl8$wt,xlab='wt',ylab='mpg',main='cyl8',xlim=c(3,5.5),ylim=c(10,20))
plot(cyl8$mpg ~ cyl8$hp,xlab='hp',ylab='mpg',main='cyl8',xlim=c(150,400),ylim=c(10,20))

# 2.利用trees 数据集，使用 layout 函数，完成面板图，要求：
## 作 Volume~Girth 的散点图，要求y轴在右边，在图像下方给出Girth的箱线图
## 作 Volume~Height 的散点图，要求y轴在左边，在图像下方给出Height的箱线图
## 在两个散点图中间给出 Volume 的箱线图
## 对子图形的坐标轴范围、标签、边距等进行设置
data(trees)
head(trees)
layout(matrix(c(1,2,3,0,4,5),nrow=2,ncol=3),widths=c(2,1,2),heights=c(4,1))
layout.show(5)
plot(trees$Volume ~ trees$Girth,yaxt='n',xlab='Girth',ylab='Volume',main='Volume~Girth')
axis(4)
boxplot(trees$Girth,horizontal=TRUE,main='Girth Boxplot')
boxplot(trees$Volume,main='Volume Boxplot')
plot(trees$Volume ~ trees$Height,xlab='Height',ylab='Volume',main='Volume~Height')
boxplot(trees$Height,horizontal=TRUE,main='Height Boxplot')

# 3.在同一个图形中画出以下函数的曲线：
## y=x^2+2*x+3
## y=x^3+2*x^2+3*x+4
## y=3+2*ln(x)
## y=1+exp(x)
## y=10-3*0.7^x
## y=3*x+4(使用abline)
## y=3(使用abline)
## x=1(使用abline)
## 要求设置为不同的线型和颜色
## 添加曲线的图例(二次曲线，三次曲线，对数曲线等)
## 在图形中添加 两个点， 一条线段，一个矩形，一个说明文字
## 把整个图形的背景设置为黄色
opar <- par()
par(bg='yellow',mfrow=c(1,1))
x1 <- 0:20
y1 <- x1^2+2*x1+3
plot(x1,y1,lty=1,col='blue',ylim=c(0,100))
x2 <- 0:20
y2 <- x2^3+2*x2^2+3*x2+4
lines(x2,y2,lty=2,col='cyan',ylim=c(0,100))
x3 <- 0:20
y3 <- 3+2*log10(x3)
lines(x3,y3,lty=3,col='green',ylim=c(0,100))
x4 <- 0:20
y4 <- 1+exp(x4)
lines(x4,y4,lty=4,col='purple',ylim=c(0,100))
x5 <- 0:20
y5 <- 10-3*0.7^x5
lines(x5,y5,lty=5,col='brown',ylim=c(0,100))
abline(a=4,b=3,col='red')
abline(h=3,col='orange')
abline(v=1,col='pink')
legend('topright',c('二次曲线','三次曲线','对数曲线','指数曲线','幂曲线','一次曲线','y=3','x=1'),lty=c(1,2,3,4,5,1,1,1),
       col=c('blue','cyan','green','purple','brown','red','orange','pink'))
points(5,5)
points(7,3+2*log10(7))
segments(2,2,5,5)
rect(3,4,7,6)
text(0,0,'原点')
par(opar)