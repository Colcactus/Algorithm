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
a=list(map(int,input().split(" ")))
def merge_sort(left,right):
    mid=int((right+left)/2)
    if((right-left)<=1):
        return
    merge_sort(left,mid)
    merge_sort(mid,right)
    b=[]
    left_p=left
    right_p=mid
    for i in range(right-left):
        if(left_p==mid):
            b.append(a[right_p])
            right_p+=1
            continue
        if(right_p==right):
            b.append(a[left_p])
            left_p+=1
            continue
        if(a[left_p]>a[right_p]):
            b.append(a[left_p])
            left_p+=1
            continue
        if(a[left_p]<=a[right_p]):
            b.append(a[right_p])
            right_p+=1
            continue
    for i in range(right-left):
        a[left+i]=b[i]
    return

merge_sort(0,len(a))
for i in a:
    print(i,end=" ")