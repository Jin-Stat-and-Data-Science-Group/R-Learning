#### hw1 #####

# 1.下载安装配置好R和Rstudio
# 2.运行 Rgui.exe，运行 rterm.exe
# 3.熟悉Rstudio中的编辑功能

# 4.分别创建2个数值对象和2个字符对象，列举出来，并删掉2个

a = 1
b = 2
c = 'zuel'
d = 'r'

ls()         # 列出对象
ls.str()     # 列出对象基本信息
rm(a,c)      # 删除对象;rm()
ls()


# 5.练习算术运算符、比较运算符和逻辑运算符

a1 = 2; b1 = 5; c1 = 8
a1+b1   # 加
a1-c1   # 减
a1*c1   # 乘
a1/c1   # 除
b1^a1   # 幂

2>5
2!=5
2<=5
2==5

(a1 == 2)|(b1 == 3)
(a1 == 2)&(b1 == 3)


# 6.包的相关操作

    # 1.查看所有已经安装的包

library()

    # 2.查看library文件夹
    # 3.浏览CRAN上所有的包，查看CRAN Task Views

    # 4.安装gtools包，安装sem包

install.packages('gtools')
install.packages('sem')

    # 5.删除sem包

remove.packages('sem')

    # 6.加载gtools包，查看所有已经加载的包

library(gtools)
search()        # 查看已加载的包; search()


# 7.帮助相关操作

    # 1.查看library函数的帮助

help('library')

    # 2.查看gtools包的帮助，列出gtools包中的所有函数

help(package = 'gtools')

    # 3.查看combinations函数的帮助，运行例子中的一些代码

help('combinations')
# 从向量的元素中枚举指定大小的可能组合
combinations(3,2,letters[1:3])      
combinations(3,2,letters[1:3],repeats=TRUE)

    # 4.打开R整个帮助系统并浏览

help.start()

    # 5.查看R的PDF格式用户手册


