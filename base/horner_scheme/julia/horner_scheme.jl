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

秦九韶算法(霍纳规则)是用于计算一元n次多项式的值的一种算法
过程分析:
设 f(x) = aₙxⁿ + aₙ₋₁xⁿ⁻¹ + … + a₁x + a₀ (aₙ ≠ 0)
将其改写为:
f(x) = (aₙxⁿ⁻¹ + aₙ₋₁xⁿ⁻² + … + a₁)x + a₀ = ((aₙxⁿ⁻² + aₙ₋₁xⁿ⁻³ + … + a₂)x + a₁)x + a₀ = (…((aₙx + aₙ₋₁)x + aₙ₋₂) · x + … + a₁)x + a₀
若令 v₀ = aₙ，则递推公式为:

v₀ = aₙ
vₖ = vₖ₋₁x + aₙ₋ₖ

其中 k = 1, 2, …, n
这样便可由v₀依次求出 v₁, v₂, v₃, …, vₙ
v₁ = v₀x + aₙ₋₁， v₂ = v₁x + aₙ₋₂, v₃ = v₂x + aₙ₋₃， …, vₙ = vₙ₋₁x + a₀

显然，当用秦九韶算法(霍纳规则)求n次多项式的值时只需要做n次乘法运算和n次加法运算

伪代码:
函数 霍纳规则 输入 x的值 一个叫coefficient(系数)的包含每个次项的系数的数组
    v = aₙ
    i = 多项式次数n
    j = 2
    当 i >= 2 时
        aᵢ 为 j 次项的系数
        v = vx + aᵢ
        i 自减
    循环结束
函数结束

注意：
Julia的数组索引从1开始

结果:
``` julia
julia> coefficient = [3, 2, -9, -11, 1]
5-element Vector{Int64}:
   3
   2
  -9
 -11
   1

julia> hornier_scheme(4, coefficient)
14
47
177
709
```

"""

function hornier_scheme(x::Int64, coefficient::AbstractArray)
    # 自动获取最高次项的系数
    v = coefficient[1]
    # 自动获取多项式次数
    i = length(coefficient)
    # 跳过第一个系数的计算，避免得到错误答案
    j = 2
    # 避免数组索引越界
    while i >= 2
        aᵢ = coefficient[j]
        println(v)
        v = v * x + aᵢ
        i -= 1
        j += 1
    end
end
