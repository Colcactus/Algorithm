# 随机数

## 线性同余发生器(Linear congruential generator)

这是一种简单且常见的伪随机数生成算法
公式如下

$$
X_{n+1} = (A * X_n + B) Mod M
$$

其中A、B和M是常数，因此A、B和M是可以取任意其它值的
