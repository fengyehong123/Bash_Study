#!/usr/bin/env bash

# ---------------------------------------------------------------------------------------------------
# ⏹算术判断
# 可以使用 ((...)) 作为算术条件，进行算术运算的判断
# 
# 💥注意点
# 1. 如果算术计算的结果是 非零值，则表示判断成立。
# 2. 如果算术计算的结果是 零，则判断不成立。
# ---------------------------------------------------------------------------------------------------

if (( 3 > 2 )); then
    echo "若 3 > 2, 则结果是: true"
    # 若 3 > 2, 则结果是: true
fi

# 🔴算术计算的结果是零，判断不成立。
if (( 0 )); then
    echo '判断成立分支'
else 
    echo '判断不成立分支...'
    # 判断不成立分支...
fi

# ------------------------------------------------
# ⏹算术条件((...))也可以用于变量赋值。
# ------------------------------------------------

# 首先将 5 赋值给变量var1，然后判断条件为 true
if (( var1 = 5 ));then 
    echo "值：$var1"; 
fi
echo "var1的值是: ${var1}"

# 首先将 0 赋值给变量var2，然后判断条件为 false
if (( var2 = 0 ));then 
    echo "这个分支进不去了。。。"
else 
    echo "值：$var2"
fi
echo "var2的值是: ${var2}"

echo -e "\e[1;31m/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_分割线_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_\e[0m"

# ------------------------------------------------
# ⏹用算术条件改写的数值判断脚本
# ------------------------------------------------
INT=-5

# ! 取反 配合 正则表达式来判断
if ! [[ "$INT" =~ ^-?[0-9]+$ ]]; then
    echo "INT变量的值不是整数..." >&2
    exit 1
fi

if ((INT == 0)); then
    echo "INT变量值是0."
else
    if ((INT < 0)); then
        echo "INT变量值是负数."
    else
        echo "INT变量值是正数."
    fi

    if (( (INT % 2) == 0 )); then
        echo "INT变量值是偶数."
    else
        echo "INT变量值是奇数."
    fi
fi