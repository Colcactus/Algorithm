"""
合理的使用线性同余发生器产生概率大致相同的的三个数值0, 1, 2，将其代入以下函数

当数值num = 0时，结果为0
当数值num = 1时，结果为1
当数值num = 2时，结果为0

因此结果概率不相等
"""
function unfairness_pseudorandom_number_algorithm(min::Int64, max::Int64, num::Int64)
    return min + num % (max - min + 1)
end

"""
其中一个办法就是将伪随机数生成器的输出值限定在0和1之间，然后再与所需范围相乘
"""
function fairness_pseudorandom_number_algorithm(min::Int64, max::Int64, num::Int64)
    # 这里的m是线性同余发生器中的M
    m = 114514
    return min + (num ÷ m) * (max - min)
end
