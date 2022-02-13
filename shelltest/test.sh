#--------------------------------------------
# linjie的shell测试学习脚本
# author：linjie
#--------------------------------------------

#!/bin/bash
echo "hello world!"
name="linjie"
echo $name
#将变量设置为只读，则不可改
#readonly name
#name="99"


#######参数传递##########
echo "看看当前传的文件名是：$0";

#$*和$@区别
#不同点：只有在双引号中体现出来。假设在脚本运行时写了三个参数 1、2、3，，则 " * " 等价于 "1 2 3"（传递了一个参数），而 "@" 等价于 "1" "2" "3"（传递了三个参数）

echo "看看当前传的参数是多少：$*";

for i in "$*";do
        echo $i
done

echo "看看当前传的参数是多少：$@";

for i in "$@";do
        echo $i
done


#######数组##########
array=(a b "c" d)
echo "第一个数组元素：${array[0]}"
echo "所有数组元素：${array[*]}" #或者${array[@]}
array[0]=q
echo "更改第一个元素后的所有数组元素：${array[*]}"
echo "数组元素个数：${#array[*]}"



#######算术运算符##########
#1、原生bash不支持简单的数学运算，但是可以通过其他命令来实现，例如 awk 和 expr，expr 最常用。
#2、表达式和运算符之间要有空格，例如 2+2 是不对的，必须写成 2 + 2
#3、完整的表达式要被 ` ` 包含，注意这个字符不是常用的单引号，在 Esc 键下边。

data1=1
data2=2
data=`expr $data1 + $data2`
echo "data1+data2:$data"

#######关系运算符##########
#1、fi为if语句的结束 相当于end
#2、如果 else 分支没有语句执行，就不要写这个 else。
data1=1
data2=2
if [$data1 -eq $data2]
then
        echo "相等"
else
        echo "不相等"
fi


#######循环##########
#for循环
for loop in 1 2 3 4 5
do
        echo "value is:$loop"
done

#while循环
#while true
$do
        #循环内容
$done

#until循环
#until正好与while相反，条件为 true 时停止。一般while循环优于until
#until condition
#do
        #循环内容
#done


#######函数##########
fun(){
        echo "shell 函数demo"
}
fun


#######文件包含##########
#创建两个sh文件（test.sh和test2.sh），test.sh可使用test2.sh的变量
#利用. filename注意点号(.)和文件名中间有一空格，或者source filename

. ./test2.sh
echo "文件包含，用到test2.sh的url链接是：$url"


#######读取文件##########
for line in `cat test2.sh`
do
        echo "读取的文件行：$line" #读取的文件分行，以空格为分行
done
