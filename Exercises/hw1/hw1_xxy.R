# 下载安装配置好R和Rstudio
# 运行 Rgui.exe，运行 rterm.exe
# 熟悉Rstudio中的编辑功能
# 1、分别创建2个数值对象和2个字符对象，列举出来，并删掉2个
a=c(1,2,3)
b=5
d=c("A",'B')
e='name'
ls()##列出对象
ls.str()
rm(a,b)##删除对象
ls()

# 2、练习算术运算符、比较运算符和逻辑运算符
a=1;b=2
a*b
a/b
b^2
a=matrix(1:6,2,3)
b=matrix(1:12,3,4)
a%*%b##矩阵乘法
11%%3##取余
1>2
2>=1
1!=2
1==2

a=c(3,5,8,1,2,9)
b=c(3,4,5,6,7,8)
a>3&b<8   ##a>3得到的逻辑值与b<8的逻辑值交
a[a<5]
a[a>3&a<9]
b[b>3|b<9]

m=5
n=8
m>1|n<2
m>1&n<2


# 3、包的相关操作
# 查看所有已经安装的包
search()
# 查看library文件夹
library()
# 浏览CRAN上所有的包，查看CRAN Task Views
# 安装gtools包，安装sem包
install.packages('gtools')
install.packages('sem')
# 删除sem包
remove.packages('sem')
# 加载gtools包，查看所有已经加载的包
library('gtools')
search()

# 4、帮助相关操作
# 查看library函数的帮助
?library
help('library')
# 查看gtools包的帮助，列出gtools包中的所有函数
help(package = 'gtools')
# 查看combinations函数的帮助，运行例子中的一些代码
help('combinations')
combinations(3,2,letters[1:3])
combinations(3,2,letters[1:3],repeats=TRUE)
     
permutations(3,2,letters[1:3])
permutations(3,2,letters[1:3],repeats=TRUE)

# 打开R整个帮助系统并浏览
help.start()

# 查看R的PDF格式用户手册
