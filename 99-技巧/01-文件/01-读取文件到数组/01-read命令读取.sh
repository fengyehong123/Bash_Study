#!/usr/bin/env bash

# ---------------------------------------------------------------------------------------------------
# ⏹使用 while read 循环读取文件内容到数组
# ---------------------------------------------------------------------------------------------------

cd "99-技巧\01-文件\01-读取文件到数组" || exit 1

# 声明数组
declare -a lines  

# ------------------------------------------------------------------------
# ⏹IFS=
#   将 IFS 设为空（默认情况下是空格、制表符、换行符），即不分割字段。
#   这意味着每一行会被整体读取，包括行首行尾的空格。
# ------------------------------------------------------------------------
while IFS= read -r line; do
    # 将每一行添加到数组中
    lines+=("$line")
done < msg.txt

# 输出数组中的内容
for line in "${lines[@]}"; do
    echo "$line"
done