"""
MIT License

Copyright (c) 2021 hattori-emi <a7b8i06c49@outlook.com> and Colcactus

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

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
