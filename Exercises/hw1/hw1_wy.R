#作业内容

##下载安装配置好R和Rstudio

##运行 Rgui.exe，运行 rterm.exe

##熟悉Rstudio中的编辑功能

##分别创建2个数值对象和2个字符对象，列举出来，并删掉2个
a=1
b=2
c='znufe'
c
d='yes'
d
rm(a)
rm(d)
ls()

##练习算术运算符、比较运算符和逻辑运算符
a=1
a+b
a-b
a*b
a/b
a^b #算术运算符

a>b
a<b
a==b
a!=b #比较运算符

(a==1)&(b==3)
(a==1)|(b==3)
!b

##包的相关操作
###查看所有已经安装的包
library()
###查看library文件夹

###浏览CRAN上所有的包，查看CRAN Task Views

###安装gtools包，安装sem包
install.packages('gtools')
install.packages('sem')

###删除sem包
remove.packages('sem')

###加载gtools包，查看所有已经加载的包
library('gtools')
search()

##帮助相关操作
###查看library函数的帮助
?library()

###查看gtools包的帮助，列出gtools包中的所有函数
help(package='gtools')

###查看combinations函数的帮助，运行例子中的一些代码
?combinations
example(combinations)

###打开R整个帮助系统并浏览
help.start()

###查看R的PDF格式用户手册

