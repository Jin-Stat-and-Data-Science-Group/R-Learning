########## 第5次作业 ###########
### 作业内容

setwd("D:/桌面/R语言学习_jl/作业hw/5")


# 1. 导入GDP数据集，分别作：
    # 1. CPI向量的点图
    # 2. 以Kapital为自变量，GDP为因变量，作它们的散点图
    # 3. 作GDP数据集的散点图矩阵
    # 4. 根据需要设置以上图形的点型，颜色，坐标轴范围，标题等选项
    # 5. 保存以上图形

data = read.csv('../data/GDP.csv', header = TRUE)
head(data)

pdf(file='hw5_1.pdf', family='GB1', width=9, height=6)   # family='GB1'能使pdf显示出中文文字

plot(data$CPI, ylab='CPI', main='CPI点图')
plot(data$Kapital, data$GDP, xlab='Kapital', ylab='GDP', main='Kapital-GDP', col='blue')
pairs(data, main='散点图矩阵')

dev.off()



# 2. 使用 mtcars 数据集：
    # 1. 作 mpg 变量的直方图
    # 2. 对 cyl 变量进行频数分析
    # 3. 作 cyl 变量的柱形图和条形图
    # 4. 作 cyl 变量的饼图
    # 5. 以 wt 变量作为自变量，以 mpg 变量作为因变量，作它们的散点图
    # 6. 按 cyl 分类， 分别作出三个类别的以 wt 变量作为自变量，以 mpg 变量作为因变量的散点图(分别用子集选取方法和使用by函数作)
    # 7. 按 cyl 分类，作以 wt 变量作为自变量，以 mpg 变量作为因变量的coplot
    # 8. 保存以上图形

pdf(file='hw5_2.pdf', family='GB1', width=9, height=6) 

attach(mtcars)
hist(mpg)
frequency = table(cyl); frequency   # 频数分析
barplot(frequency, main='cyl柱形图', xlab='cyl', ylab='frequency')
pie(frequency, main='cyl饼图')
plot(wt, mpg, main='wt-mpg')

b1 = by(wt, cyl, function(x) x)   # by函数
b2 = by(mpg, cyl, function(x) x)
par(mfrow=c(3,1))
plot(as.numeric(unlist(b1[1])),as.numeric(unlist(b2[1])), xlab='wt', ylab='mpg', main='4 cyl')
plot(as.numeric(unlist(b1[2])),as.numeric(unlist(b2[2])), xlab='wt', ylab='mpg', main='6 cyl')
plot(as.numeric(unlist(b1[3])),as.numeric(unlist(b2[3])), xlab='wt', ylab='mpg', main='8 cyl')

data1=mtcars[mtcars$cyl=="4",]    # 子集选取
data2=mtcars[mtcars$cyl=="6",]
data3=mtcars[mtcars$cyl=="8",]
par(mfrow=c(3,1))
plot(data1$wt, data1$mpg, main="4 cyl", xlab='wt', ylab='mpg')   
plot(data2$wt, data2$mpg, main="6 cyl", xlab='wt', ylab='mpg')   
plot(data3$wt, data3$mpg, main="8 cyl", xlab='wt', ylab='mpg')

CYL = factor(cyl, levels=c(4, 6, 8), labels=c('4 cylinder','6 cylinder','8 cylinder'))
coplot(mpg ~ wt | CYL, xlab='wt', ylab='mpg')   # 按cyl分类

dev.off()
 


# 3. 在同一个图形中画出以下函数的曲线：
    # 1. y=3*x+4
    # 2. y=x^2+2*x+3
    # 3. y=x^3+2*x^2+3*x+4
    # 4. y=3+2*ln(x)
    # 5. y=1+exp(x)
    # 6. y=10-3*0.7^x
    # 7. 要求设置为不同的线型和颜色
    # 8. 保存该图形

pdf(file="hw5_3.pdf", family='GB1', width=9, height=6)

par(mfrow=c(2,3))   
x1=-100:100
y1=3*x1+4
plot(x1, y1, type='l', col='red', lwd=2)  
x2=-100:100
y2=x2^2+2*x2+3
plot(x2, y2, type='b', lty=2, col='black', lwd=1)  
x3=-100:100
y3=x3^3+2*x3^2+3*x3+4
plot(x3,y3,type='l',lty=3,col='green',lwd=3)  
x4=0:200
y4=3+2*log(x4)
plot(x4,y4,type='b',lty=4,col='red',lwd=2)  
x5=-100:100
y5=1+exp(x5)
plot(x5,y5,type='o',lty=5,col='blue',lwd=1.5)
x6=-100:100
y6=10-3*0.7^x6
plot(x6,y6,type='l',lty=6,col='black',lwd=2)

dev.off()



