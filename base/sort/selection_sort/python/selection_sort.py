a=input()
a=list(map(int,a.split(" ")))
lenth=len(a)
for i in range(lenth-1):
    _max=i
    for j in range(i+1,lenth,1):
        if(a[j]>a[_max]):
            _max=j
    temp=a[i]
    a[i]=a[_max]
    a[_max]=temp
for i in a:
    print(i,end=" ")