# 秦九韶算法(霍纳规则)

它是用于计算一元n次多项式的值的一种算法

## 过程分析

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

## 伪代码

> 此伪代码适用于数组索引从0开始的编程语言

```
函数 霍纳规则 输入 x的值 一个叫coefficient(系数)的包含每个次项的系数的数组
    v = aₙ
    i = 多项式次数n
    当 i >= 0 时
        aᵢ 为 i 次项的系数
        v = vx + aᵢ
        i 自减
    循环结束
函数结束
```
---

<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/"><img alt="知识共享许可协议" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png" /></a><br />本作品采用<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/">知识共享署名-非商业性使用-禁止演绎 4.0 国际许可协议</a>进行许可。

作品所有权归属于：hattori-emi <a7b8i06c49@outlook.com> 与 Colcactus
