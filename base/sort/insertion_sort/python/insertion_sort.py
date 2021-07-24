"""
MIT License

Copyright (c) 2021 Anslate <1959719289@qq.com> and Colcactus

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

输入样式：
例：
1 3 2 5 4
共一行
待排序数组，数据之间加空格
输出样式：
例：
5 4 3 2 1
共一行
表示排序完毕的数组
"""
a=input()
a=list(map(int,a.split(" ")))
lenth=len(a)
for i in range(lenth):
    temp=a[i]
    j=i-1
    while((a[j]<temp)and(j>=0)):
#              ^  <号是从大到小，>号从小到大
        a[j+1]=a[j]
        j-=1
    a[j+1]=temp
for i in a:
    print(i,end=" ")
