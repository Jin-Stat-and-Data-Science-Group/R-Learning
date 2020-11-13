###作业内容###

#1.导入GDP数据集，分别作：
setwd('C:/github_repos/R-Learning/Exercises/hw5')
gdp = read.csv('GDP.csv')
pdf(file = '1.pdf')
    #(1)CPI向量的点图
    plot(gdp$CPI,main='CPI点图',pch=16)
    #(2)以Kapital为自变量，GDP为因变量，作它们的散点图
    plot(gdp$Kapital, gdp$GDP,xlim=c(0,2000),ylim=c(0,5000),xlab = 'Kapital', ylab='GDP',pch=19,col='blue')
    #(3)作GDP数据集的散点图矩阵
    pairs(gdp)
    #(4)根据需要设置以上图形的点型，颜色，坐标轴范围，标题等选项
    #(5)保存以上图形
    dev.off()

#2.使用 mtcars 数据集：
mtdata = mtcars
opar=par(no.readonly=TRUE)
pdf(file='2.pdf')
    #(1)作 mpg 变量的直方图
    hist(mtdata$mpg)

    #(2)对 cyl 变量进行频数分析
    hist(mtdata$cyl)
    ?hist

    #(3)作 cyl 变量的柱形图和条形图
    barplot(table(mtdata$cyl),xlab='cyl',ylab='frequency',main='barplot of cyl')
    barplot(table(mtdata$cyl),xlab='frequency',ylab='cyl',main='barplot of cyl',horiz=TRUE)
    ?barplot

    #(4)作 cyl 变量的饼图
    ?pie
    pie(table(mtdata$cyl),main='pie chart of cyl')

    #(5)以 wt 变量作为自变量，以 mpg 变量作为因变量，作它们的散点图
    plot(mtdata$wt,mtdata$mpg,col='grey',pch=16)

    #(6)按 cyl 分类， 分别作出三个类别的以 wt 变量作为自变量，以 mpg 变量作为因
    #变量的散点图(分别用子集选取方法和使用by函数作)
    #by函数
    by(mtdata$wt,mtdata$cyl,function(x) x)
    by(mtdata$mpg,mtdata$cyl,function(x) x)
    plot(as.numeric(unlist(by(mtdata$wt,mtdata$cyl,function(x) x)[1])),as.numeric(unlist(by(mtdata$mpg,mtdata$cyl,function(x) x)[1])),xlab="wt",ylab='mpg',main='4 cyl')
    plot(as.numeric(unlist(by(mtdata$wt,mtdata$cyl,function(x) x)[2])),as.numeric(unlist(by(mtdata$mpg,mtdata$cyl,function(x) x)[2])),xlab="wt",ylab='mpg',main='6 cyl')
    plot(as.numeric(unlist(by(mtdata$wt,mtdata$cyl,function(x) x)[3])),as.numeric(unlist(by(mtdata$mpg,mtdata$cyl,function(x) x)[3])),xlab="wt",ylab='mpg',main='8 cyl')
    #子集选取
    cyl.4=mtdata[mtdata$cyl=='4',]
    cyl.6=mtdata[mtdata$cyl=='6',]
    cyl.8=mtdata[mtdata$cyl=='8',]
    cyl1=factor(mtdata$cyl,levels = c(4,6,8),labels = c('4 cyl','6 cyl','8 cyl'))
    plot(cyl.4$wt,cyl.4$mpg,xlab="wt",ylab='mpg',main='4 cyl')
    plot(cyl.6$wt,cyl.6$mpg,xlab="wt",ylab='mpg',main='6 cyl')
    plot(cyl.8$wt,cyl.8$mpg,xlab="wt",ylab='mpg',main='8 cyl')

    #(7)按 cyl 分类，作以 wt 变量作为自变量，以 mpg 变量作为因变量的coplot
    cyl1=factor(mtdata$cyl,levels=c(4,6,8),labels=c("4 cyl","6 cyl","8 cyl"))
    coplot(mtdata$mpg~mtdata$wt|cyl1,data=mtdata)

    #(8)保存以上图形
    dev.off()

#3.在同一个图形中画出以下函数的曲线：
    #(1)y=3*x+4
    #(2)y=x^2+2*x+3
    #(3)y=x^3+2*x^2+3*x+4
    #(4)y=3+2*ln(x)
    #(5)y=1+exp(x)
    #(6)y=10-3*0.7^x
    #(7)要求设置为不同的线型和颜色
    #(8)保存该图形
    pdf('3.pdf')
    par(mfrow=c(2,3))
    x= -20:20
    y1=3*x+4
    y2=x^2+2*x+3
    y3=x^3+2*x^2+3*x+4

    x1=0:170
    y4=3+2*log(x1)
    y5=1+exp(x)
    y6=10-3*0.7^x
    
    plot(x,y1,type='l',col='red')
    plot(x,y2,type='b',col='blue')
    plot(x,y3,type='o',col='green')
    plot(x1,y4,type='s',col='yellow')
    plot(x,y5,type='S',col='grey')
    plot(x,y6,type='l')
    dev.off()

