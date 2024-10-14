#!/usr/bin/env bash

# ------------------------------------------------------------------------------------
# ⏹用户创建的变量仅可用于当前 Shell，子 Shell 默认读取不到父 Shell 定义的变量。
# 为了把变量传递给子 Shell，需要使用export命令。
# 这样输出的变量，对于子 Shell 来说就是环境变量。
# 相当于通过 export 命令，声明了子shell所需的环境变量
# ------------------------------------------------------------------------------------

# 定义两个变量
name1='fegyehong'
# ⏹通过 export 命令，向子shell输出变量
export name2='jiafeitian'

echo "${name1} and ${name2}"

echo -e "\e[1;31m/_/_/_/_/_/_/_/_/_/_/_/_/_/_子shell开始执行_/_/_/_/_/_/_/_/_/_/_/_/_/_/\e[0m"

# ⏹在父shell中调用子shell，由于此时 name1 变量并没有通过 export 命令输出到子shell中，所以name1的打印为空
bash ./01-变量/06-z_children.sh

echo -e "\e[1;31m/_/_/_/_/_/_/_/_/_/_/_/_/_/_子shell执行完毕_/_/_/_/_/_/_/_/_/_/_/_/_/_/\e[0m"

echo -e "\e[1;32m===========================子shell开始执行===========================\e[0m"

# ⏹此时 name1 和 name2 变量都输出到子shell中，因此最终 打印出如下内容
export name1
bash ./01-变量/06-z_children.sh
# 06-z_children.sh 执行了
# fegyehong
# jiafeitian

echo -e "\e[1;32m===========================子shell执行完毕===========================\e[0m"