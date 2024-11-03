#!/usr/bin/env bash

# ---------------------------------------------------------------------------------------------------
# ⏹字符串判断
# [ string ]
#           如果string不为空（长度大于0），则判断为真。
# [ -n string ]
#           如果字符串string的长度大于零，则判断为真。
# [ -z string ]
#           如果字符串string的长度为零，则判断为真。
# [ string1 = string2 ]
#           如果string1和string2相同，则判断为真。
# [ string1 == string2 ]
#           等同于[ string1 = string2 ]
# [ string1 != string2 ]
#           如果string1和string2不相同，则判断为真。
# ---------------------------------------------------------------------------------------------------

echo -n "输入你的回答 > "
read -r result

# 如果字符串的长度为0，说明用户没有输入
if [ -z "$result" ]; then
    # ---------------------------------------------------------
    # 🔴>&2 会将 echo 的内容发送到标准错误，而不是标准输出。
    # 这样做通常用于提示错误信息，以便和普通输出区分开来。
    # ---------------------------------------------------------
    echo '用户并没有回答...' >&2
    exit 1
fi

# ---------------------------------------------------------
# 字符串判断时，变量要放在双引号之中
# 如果不放在双引号之中，变量为空时，命令会变成[ -n ]，这时会判断为 true
# 如果放在双引号之中，[ -n "" ]就判断为 false
# ---------------------------------------------------------
if [ -n "$result" ]; then
    echo "用户回答了，用户的回答是: $result"
fi

if [ "$result" = 'yes' ]; then
    echo '用户选择了是'
elif [ "$result" == 'no' ]; then
    echo '用户选择了否'
else
    echo '用户选择了其他的答案'
fi