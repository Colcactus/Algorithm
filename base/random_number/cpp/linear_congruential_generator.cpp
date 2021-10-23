/*
MIT License

Copyright (c) 2021 Anslate <1959719289@qq.com> hattori-emi <a7b8i06c49@outlook.com> and Colcactus

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

这是一种简单且常见的伪随机数生成算法
公式如下:

Xₙ₊₁ = (A × Xₙ + B) Mod M

其中A、B和M是常数，因此在下面的代码中A、B和M是可以取任意其它值的，但最优选是A = 25214903917、B = 11、C = 2^48
原算法输出如下:(A = 7, B = 5, M = 11)
8
6
3
4
0
5
7
10
9
2
8

后算法输出如下:
50429807845
-151174310397044
197748051927719
161694279895846
63052479226681
-102186399074992
148544920408859
113574016328842
-60143030400307
167765679818580
249775507363535

根据原算法输出内容我们可以看出循环第11次的时候这组数据开始重复了
一般伪随机数生成器使用有多个常数的多元线性同余发生器，并从生成的数据中选择一些数据来使结果看起来更加随机
*/

#include<cstdio>
using namespace std;
int main(){
	long A=25214903917;
	int B=11;
	long M=1L << 48;
	int X=2;
	// X是随机数种子
	int i;
	for(i=0;i<11;i++){
		X=(A*X+B)%M;
		printf("%d\n",X); 
	}
	return 0; 
} 
