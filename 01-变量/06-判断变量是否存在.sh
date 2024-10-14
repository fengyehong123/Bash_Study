#!/usr/bin/env bash

# ------------------------------------------------------------
# ⏹-n : 用于检查变量有值
# 空字符串不算有值
# ------------------------------------------------------------
var1=''
if [[ -n "${var1}" ]]; then
    echo "①var1这个变量是存在的。值: ${var1}"
else
    echo "①var1这个变量值是不存在的"
fi

# ------------------------------------------------------------
# ⏹-z : 用于检查变量没有值
# 空字符串不算有值
# ------------------------------------------------------------
var2=''
if [[ -z "${var2}" ]]; then
    echo "②var2这个变量值是不存在的"
else 
    echo "②var2这个变量是存在的。值: ${var2}"
fi
echo -e "\e[1;31m/_/_/_/_/_/_/_/_/_/_/_/_/_/_分割线_/_/_/_/_/_/_/_/_/_/_/_/_/_/\e[0m"

# ------------------------------------------------------------
# ⏹-v
# 从 Bash 4.2 开始，-v 选项可以用于判断变量是否被定义。
# 侧重点为是否被定义，如果是空字符串的话，变量也算被定义，只不过值为空字符串而已。
# ------------------------------------------------------------
if [ -v var1 ]; then
    echo '③变量 var1 已定义'
else 
    echo '③变量 var1 未定义'
fi

# ------------------------------------------------------------
# ⏹"${变量名+x}"
# 如果变量已经被定义，则返回x；否则返回空
# 可以利用这一点判断变量是否已经定义
# 只能判断变量是都被定义，无法判断是否是空字符串
# ⭕作用：判断变量是否已定义
# ------------------------------------------------------------
unset var3
var3=''

if [ "${var3+x}" ]; then
  echo "④变量 var3 已定义"
else
  echo "④变量 var3 未定义"
fi

# ------------------------------------------------------------
# ⏹"${变量名:+x}"
# 用于检查变量有值
# ⭕作用：判断变量是否有值，且必须是非空值。
# ------------------------------------------------------------
unset var4
var4=''

if [ "${var4:+x}" ]; then
  echo "⑤var4这个变量是存在的。值: ${var4}"
else
  echo "⑤var4这个变量值是不存在的"
fi

echo -e "\e[1;31m/_/_/_/_/_/_/_/_/_/_/_/_/_/_分割线_/_/_/_/_/_/_/_/_/_/_/_/_/_/\e[0m"

# ------------------------------------------------------------
# ⏹判断环境变量是否存在
# ------------------------------------------------------------
if printenv USERNAME > /dev/null 2>&1; then
    echo "环境变量 USERNAME 存在"  # 环境变量 USERNAME 存在
else
    echo "环境变量 USERNAME 不存在"
fi

if printenv NOT_EXIST_NAME > /dev/null 2>&1; then
    echo "环境变量 NOT_EXIST_NAME 存在"
else
    echo "环境变量 NOT_EXIST_NAME 不存在"  # 环境变量 NOT_EXIST_NAME 不存在
fi