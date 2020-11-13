######## 第6次作业 #########
### 作业内容

setwd('D:/桌面/R语言学习_jl/作业hw/6')


# 1. 利用mtcars数据集，使用图形参数的方法作一个包含3行2列的面板图，要求第一列包含4，6，8缸汽车的 mpg~wt 的散点图，第二列包含包含4，6，8缸汽车的 mpg~hp 的散点图, 并对子图形的坐标轴范围、标签、边距等进行设置。

pdf(file="hw6_1.pdf")

data1=mtcars[mtcars$cyl=="4",]
data2=mtcars[mtcars$cyl=="6",]
data3=mtcars[mtcars$cyl=="8",]

par(mfcol=c(3,2))
plot(data1$wt, data1$mpg, main="4 cyl",ylim=c(20,35), xlab='wt', ylab='mpg')   
plot(data2$wt, data2$mpg, main="6 cyl",ylim=c(18,22), xlab='wt', ylab='mpg')   
plot(data3$wt, data3$mpg, main="8 cyl",ylim=c(10,20), xlab='wt', ylab='mpg')  
plot(data1$hp, data1$mpg, main="4 cyl", xlim=c(50,120), ylim=c(22,30), xlab='hp', ylab='mpg')   
plot(data2$hp, data2$mpg, main="6 cyl", xlim=c(105,180), ylim=c(18,22), xlab='hp', ylab='mpg')   
plot(data3$hp, data3$mpg, main="8 cyl", xlim=c(150,340), ylim=c(10,20), xlab='hp', ylab='mpg')    

dev.off()



# 2. 利用 trees 数据集，使用 layout 函数，完成面板图，要求：
    # 1. 作 Volume~Girth 的散点图，要求y轴在右边，在图像下方给出Girth的箱线图
    # 2. 作 Volume~Height 的散点图，要求y轴在左边，在图像下方给出Height的箱线图
    # 3. 在两个散点图中间给出 Volume 的箱线图.
    # 4. 对子图形的坐标轴范围、标签、边距等进行设置

attach(trees)

layout(matrix(c(1,2,3,0,4,5), nrow=2), widths=c(3,1,3), heights=c(3,1)) # 构建复合图形
layout.show(5)

plot(Girth, Volume, type="b", pch=5, col="red", yaxt="n")  # yaxt="n": 禁用y轴
axis(side=4, at=Volume, labels=Volume)     # y轴在右边

boxplot(Girth, horizontal = TRUE, main="Girth")  # horizontal = TRUE: 将图旋转90度

boxplot(Volume, main="Volume")

plot(Height, Volume, type="b", pch=5, col="green")

boxplot(Height, horizontal = TRUE, main="Height")



# 3. 在同一个图形中画出以下函数的曲线：
    # 1. y=x^2+2*x+3
    # 2. y=x^3+2*x^2+3*x+4
    # 3. y=3+2*ln(x)
    # 4. y=1+exp(x)
    # 5. y=10-3*0.7^x
    # 6. y=3*x+4(使用abline)
    # 7. y=3(使用abline)
    # 8. x=1(使用abline)
    # 9. 要求设置为不同的线型和颜色
    # 10. 添加曲线的图例(二次曲线，三次曲线，对数曲线等)
    # 11. 在图形中添加 两个点， 一条线段，一个矩形，一个说明文字
    # 12. 把整个图形的背景设置为黄色

par(bg="yellow")   # 背景设置为黄色

x1=-3:3           
y1=x1^2+2*x1+3             
plot(x1,y1,type='l',lty=1,col='green',lwd=2)
x2=-3:3
y2=x2^3+2*x2^2+3*x2+4             
lines(x2,y2,type='b',lty=2,col='blue',lwd=2)    
x3=0:3          
y3=3+2*log(x3)             
lines(x3,y3,type='l',lty=3,col='grey',lwd=2.5)  
x4=-3:3
y4=1+exp(x4)
lines(x4,y4,type='b',lty=4,col='purple',lwd=2)
x5=-3:3
y5=10-3*0.7^x5
lines(x5,y5,type='b',lty=5,col='red',lwd=1.5)

abline(a=4,b=3,col='pink')
abline(h=3,col="blue")
abline(v=1,col="blue")

legend("topleft", inset=.05, title="line type", lty=c(1,2,3,4,5), col=c("green","blue","grey","purple","red","pink","blue","blue"), c('二次曲线','三次曲线','对数曲线','指数曲线','指数曲线','一次曲线'))

points(-2,10)
points(-2,9)

segments(-0.5,15,0.5,15)
rect(-1,8,0,10)
text(0,18,label="hw6_lyt")










