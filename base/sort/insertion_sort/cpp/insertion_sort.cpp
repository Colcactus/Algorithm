/*
输入样式：
例：
5
1 3 2 5 4
共两行
第一行n表示第二行的数据数量
第二行数据是待排序数组，共n个，数据之间加空格
输出样式：
例：
5 4 3 2 1
共一行
表示排序完毕的数组

数据不超过int范围
*/
#include<cstdio>
using namespace std;
int main(){
    int lenth,i,j,temp;
	scanf("%d",&lenth);
	int a[lenth+1];
	for(i=0;i<lenth;i++){
		scanf("%d",&a[i]);
	}
    for(i=1;i<lenth;i++){
        temp=a[i];
        for(j=i-1;(a[j]<temp)&&(j>=0);j--){
            a[j+1]=a[j];
        }
        a[j+1]=temp;
    }
	for(i=0;i<lenth;i++){
        printf("%d ",a[i]);
	}
	return 0;
}
