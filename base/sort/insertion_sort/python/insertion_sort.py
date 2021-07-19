"""
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
