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
array=input()
array=list(map(int,array.split(" ")))
n=1
lenth=len(array)
for n in range(1,lenth,1):
    for i in range(0,lenth-n,1):
        if(array[i]<array[i+1]):#<号是从大到小，>号从小到大 
            temp=array[i]
            array[i]=array[i+1]
            array[i+1]=temp

for i in array:
    print(i,end=" ")