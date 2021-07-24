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
Latex公式如下:

X_{n+1} = (A * X_n + B) Mod M

其中A、B和M是常数，因此在下面的代码中A、B和M是可以取任意其它值的
输出如下:
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

根据输出内容我们可以看出循环第11次的时候这组数据开始重复了
一般伪随机数生成器使用有多个常数的多元线性同余发生器，并从生成的数据中选择一些数据来使结果看起来更加随机
*/

#include<cstdio>
using namespace std;
int main(){
	int A=7;
	int B=5;
	int M=11;
	int X=2;
	// X是随机数种子
	int i;
	for(i=0;i<11;i++){
		X=(A*X+B)%M;
		printf("%d\n",X); 
	}
	return 0; 
} 
